//
//  ViewController.swift
//  EthioTime
//
//  Migrated to Swift with modern patterns
//

import UIKit

@MainActor
class ViewController: UIViewController {

    // MARK: - Properties

    nonisolated(unsafe) private var timer: Timer?
    private var timerFlag = false

    // MARK: - UI Components

    private let localTimeView = TimeDisplayView(title: "Local Time",
                                                 backgroundColor: UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1.0))
    private let ethiopianLocalTimeView = TimeDisplayView(title: "Ethiopian Local Time",
                                                         backgroundColor: UIColor(red: 235/255, green: 235/255, blue: 235/255, alpha: 1.0))
    private let ethiopianClockTimeView = TimeDisplayView(title: "Ethiopian 12-hour clock Time",
                                                         backgroundColor: UIColor(red: 225/255, green: 225/255, blue: 225/255, alpha: 1.0))

    private lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [localTimeView, ethiopianLocalTimeView, ethiopianClockTimeView])
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 0
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        startTimer()
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return [.portrait, .portraitUpsideDown]
    }

    // MARK: - Setup

    private func setupUI() {
        view.backgroundColor = UIColor(red: 215/255, green: 215/255, blue: 215/255, alpha: 1.0)

        view.addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])

        // Add border to middle view
        ethiopianLocalTimeView.layer.borderColor = UIColor.lightGray.cgColor
        ethiopianLocalTimeView.layer.borderWidth = 1.0

        updateAllTimes()
    }

    private func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(updateAllTimes), userInfo: nil, repeats: true)
    }

    // MARK: - Time Updates

    @objc private func updateAllTimes() {
        let now = Date()

        // Update local time
        localTimeView.updateTime(with: now, timeZoneOffset: 0)

        // Update Ethiopian local time (UTC +3 hours)
        ethiopianLocalTimeView.updateTime(with: now, timeZoneOffset: 3 * 3600)

        // Update Ethiopian 12-hour clock time (UTC -3 hours from local, which is their time system)
        ethiopianClockTimeView.updateTime(with: now, timeZoneOffset: -3 * 3600, hideAMPM: true)

        // Toggle colon visibility
        timerFlag.toggle()
        localTimeView.setColonVisible(timerFlag)
        ethiopianLocalTimeView.setColonVisible(timerFlag)
        ethiopianClockTimeView.setColonVisible(timerFlag)
    }

    deinit {
        timer?.invalidate()
    }
}

// MARK: - TimeDisplayView

class TimeDisplayView: UIView {

    // MARK: - Properties

    private let title: String
    private let customBackgroundColor: UIColor

    // MARK: - UI Components

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.font = UIFont(name: "HelveticaNeue-Medium", size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let separatorLine: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let hourLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .right
        label.font = UIFont(name: "digital-7", size: 55)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let colonLabel: UILabel = {
        let label = UILabel()
        label.text = ":"
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont(name: "digital-7", size: 55)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.setContentHuggingPriority(.required, for: .horizontal)
        return label
    }()

    private let minuteLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont(name: "digital-7", size: 55)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var timeStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [hourLabel, colonLabel, minuteLabel])
        stack.axis = .horizontal
        stack.spacing = 0
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    // MARK: - Initialization

    init(title: String, backgroundColor: UIColor) {
        self.title = title
        self.customBackgroundColor = backgroundColor
        super.init(frame: .zero)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup

    private func setupUI() {
        backgroundColor = customBackgroundColor

        titleLabel.text = title

        addSubview(titleLabel)
        addSubview(separatorLine)
        addSubview(timeStackView)

        // Adjust font size for iPad
        if UIDevice.current.userInterfaceIdiom == .pad {
            titleLabel.font = UIFont(name: "HelveticaNeue-Medium", size: 35)
            hourLabel.font = UIFont(name: "digital-7", size: 90)
            colonLabel.font = UIFont(name: "digital-7", size: 75)
            minuteLabel.font = UIFont(name: "digital-7", size: 90)
        }

        NSLayoutConstraint.activate([
            // Title label
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),

            // Separator line
            separatorLine.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            separatorLine.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            separatorLine.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            separatorLine.heightAnchor.constraint(equalToConstant: 1),

            // Time stack view
            timeStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            timeStackView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 20)
        ])
    }

    // MARK: - Public Methods

    func updateTime(with date: Date, timeZoneOffset: TimeInterval, hideAMPM: Bool = false) {
        let adjustedDate = date.addingTimeInterval(timeZoneOffset)

        let hourFormatter = DateFormatter()
        hourFormatter.dateFormat = "h"
        hourFormatter.timeZone = TimeZone(secondsFromGMT: Int(timeZoneOffset))

        let minuteFormatter = DateFormatter()
        minuteFormatter.dateFormat = hideAMPM ? "mm" : "mm a"
        minuteFormatter.timeZone = TimeZone(secondsFromGMT: Int(timeZoneOffset))

        hourLabel.text = hourFormatter.string(from: adjustedDate)
        minuteLabel.text = minuteFormatter.string(from: adjustedDate)
    }

    func setColonVisible(_ visible: Bool) {
        colonLabel.textColor = visible ? .black : .clear
    }
}
