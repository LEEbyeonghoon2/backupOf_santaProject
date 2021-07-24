//
//  AddHistoryView.swift
//  santaProject
//
//  Created by Juwon Kim on 2021/07/10.
//

import UIKit

protocol AddHistoryViewDelegate: AnyObject {
    func didTapDoneButton()
    func didTapCancelButton()
    func didTapSelectMountainButton()
    func didTapDatePickButton()
}

class AddHistoryView: UIView {

    weak var delegate: AddHistoryViewDelegate?

    let imageView = UIImageView(image: UIImage(named: "santaAddHistoryImage"))
    let titleLabel = UILabel()

    let mountainNameTitleLabel = UILabel()
    let selectMountainButton = UIButton()
    let mountainNameLine = UIView()
    let mountainNamePlaceholderView = UIView()
    let mountainNameLabel = UILabel()

    let dateTitleLabel = UILabel()
    let datePickButton = UIButton()
    let dateLine = UIView()
    let datePickPlaceholderView = UIView()
    let dateLabel = UILabel()

    let doneButton = UIButton()
    let cancelButton = UIButton()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white

        setupImageView()
        setupTitleLabel()
        setupMountainName()
        setupDate()
        setupDoneButton()
        setupCancelButton()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupImageView() {
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: Layout.topMargin).isActive = true

        imageView.contentMode = .scaleToFill
    }

    private func setupTitleLabel() {
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Layout.Title.leadingMargin).isActive = true
        titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: Layout.Title.topMargin).isActive = true
        titleLabel.numberOfLines = 2
        titleLabel.font = .systemFont(ofSize: Layout.Title.fontSize, weight: Layout.Title.weight)
        titleLabel.textColor = .stGreen50

        let attrString = NSMutableAttributedString(string: "어떤 산을\n다녀오셨나요?")
        let range = NSRange(location: 0, length: attrString.length)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = Layout.Title.lineSpacing

        attrString.addAttribute(.kern, value: Layout.letterSpacing, range: range)
        attrString.addAttribute(.paragraphStyle, value: paragraphStyle, range: range)
        titleLabel.attributedText = attrString
        titleLabel.sizeToFit()
    }

    private func setupMountainName() {
        setupTitleLabel()
        setupSelectMountainButton()
        setupMountainNamePlaceHolder()
        setupMountainNameLine()
        setupMountainNameLabel()

        func setupTitleLabel() {
            let label = mountainNameTitleLabel
            addSubview(label)
            label.translatesAutoresizingMaskIntoConstraints = false
            label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 40).isActive = true
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Layout.sideMargin).isActive = true
            label.font = .systemFont(ofSize: 20, weight: .init(400))
            label.textColor = .stCoolGray70

            let attrString = NSMutableAttributedString(string: "다녀온 산")
            let range = NSRange(location: 0, length: attrString.length)
            attrString.addAttribute(.kern, value: Layout.letterSpacing, range: range)
            label.attributedText = attrString
        }

        func setupSelectMountainButton() {
            let button = selectMountainButton
            addSubview(button)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.topAnchor.constraint(equalTo: mountainNameTitleLabel.bottomAnchor, constant: 22).isActive = true
            button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Layout.sideMargin).isActive = true
            button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Layout.sideMargin).isActive = true
            button.heightAnchor.constraint(equalToConstant: 24).isActive = true
            button.addTarget(self, action: #selector(didTapSelectMountainButton(_:)), for: .touchUpInside)
        }

        func setupMountainNamePlaceHolder() {
            let view = mountainNamePlaceholderView
            selectMountainButton.addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
            view.isUserInteractionEnabled = false
            view.leadingAnchor.constraint(equalTo: selectMountainButton.leadingAnchor).isActive = true
            view.topAnchor.constraint(equalTo: selectMountainButton.topAnchor).isActive = true
            view.bottomAnchor.constraint(equalTo: selectMountainButton.bottomAnchor).isActive = true

            let label = UILabel()
            view.addSubview(label)
            label.translatesAutoresizingMaskIntoConstraints = false
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            label.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
            label.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

            label.font = .systemFont(ofSize: 24, weight: .init(400))
            label.textColor = .stCoolGray70

            let attrString = NSMutableAttributedString(string: "산 검색하기")
            let range = NSRange(location: 0, length: attrString.length)
            attrString.addAttribute(.kern, value: Layout.letterSpacing, range: range)
            label.attributedText = attrString
            label.sizeToFit()

            let imageView = UIImageView(image: #imageLiteral(resourceName: "santaIconArrow"))
            view.addSubview(imageView)
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.leadingAnchor.constraint(equalTo: label.trailingAnchor, constant: 8).isActive = true
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            imageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        }

        func setupMountainNameLine() {
            let line = mountainNameLine
            addSubview(line)
            line.translatesAutoresizingMaskIntoConstraints = false
            line.topAnchor.constraint(equalTo: selectMountainButton.bottomAnchor, constant: 12).isActive = true
            line.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Layout.sideMargin).isActive = true
            line.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Layout.sideMargin).isActive = true
            line.heightAnchor.constraint(equalToConstant: 2).isActive = true
            line.backgroundColor = .stCoolGray30
        }

        func setupMountainNameLabel() {
            let label = mountainNameLabel
            selectMountainButton.addSubview(label)
            label.translatesAutoresizingMaskIntoConstraints = false
            label.isUserInteractionEnabled = false
            label.leadingAnchor.constraint(equalTo: selectMountainButton.leadingAnchor).isActive = true
            label.topAnchor.constraint(equalTo: selectMountainButton.topAnchor).isActive = true
            label.bottomAnchor.constraint(equalTo: selectMountainButton.bottomAnchor).isActive = true

            label.font = .systemFont(ofSize: 24)
            label.textColor = .stGreen40
        }
    }

    private func setupDate() {
        setupTitleLabel()
        setupDatePickButton()
        setupDatePickPlaceHolder()
        setupDateLine()
        setupDateLabel()

        func setupTitleLabel() {
            let label = dateTitleLabel
            addSubview(label)
            label.translatesAutoresizingMaskIntoConstraints = false
            label.topAnchor.constraint(equalTo: mountainNameLine.bottomAnchor, constant: 48).isActive = true
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Layout.sideMargin).isActive = true
            label.font = .systemFont(ofSize: 20, weight: .init(400))
            label.textColor = .stCoolGray70

            let attrString = NSMutableAttributedString(string: "다녀온 날짜")
            let range = NSRange(location: 0, length: attrString.length)
            attrString.addAttribute(.kern, value: Layout.letterSpacing, range: range)
            label.attributedText = attrString
        }

        func setupDatePickButton() {
            let button = datePickButton
            addSubview(button)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.topAnchor.constraint(equalTo: dateTitleLabel.bottomAnchor, constant: 22).isActive = true
            button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Layout.sideMargin).isActive = true
            button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Layout.sideMargin).isActive = true
            button.heightAnchor.constraint(equalToConstant: 24).isActive = true
            button.addTarget(self, action: #selector(didTapDatePickButton(_:)), for: .touchUpInside)
        }

        func setupDatePickPlaceHolder() {
            let view = datePickPlaceholderView
            datePickButton.addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
            view.isUserInteractionEnabled = false
            view.leadingAnchor.constraint(equalTo: datePickButton.leadingAnchor).isActive = true
            view.topAnchor.constraint(equalTo: datePickButton.topAnchor).isActive = true
            view.bottomAnchor.constraint(equalTo: datePickButton.bottomAnchor).isActive = true

            let label = UILabel()
            view.addSubview(label)
            label.translatesAutoresizingMaskIntoConstraints = false
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            label.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
            label.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

            label.font = .systemFont(ofSize: 24, weight: .init(400))
            label.textColor = .stCoolGray70

            let attrString = NSMutableAttributedString(string: "날짜 선택하기")
            let range = NSRange(location: 0, length: attrString.length)
            attrString.addAttribute(.kern, value: Layout.letterSpacing, range: range)
            label.attributedText = attrString
            label.sizeToFit()

            let imageView = UIImageView(image: #imageLiteral(resourceName: "santaIconArrow"))
            view.addSubview(imageView)
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.leadingAnchor.constraint(equalTo: label.trailingAnchor, constant: 8).isActive = true
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            imageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        }

        func setupDateLine() {
            let line = dateLine
            addSubview(line)
            line.translatesAutoresizingMaskIntoConstraints = false
            line.topAnchor.constraint(equalTo: datePickButton.bottomAnchor, constant: 12).isActive = true
            line.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Layout.sideMargin).isActive = true
            line.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Layout.sideMargin).isActive = true
            line.heightAnchor.constraint(equalToConstant: 2).isActive = true
            line.backgroundColor = .stCoolGray30
        }

        func setupDateLabel() {
            let label = dateLabel
            datePickButton.addSubview(label)
            label.translatesAutoresizingMaskIntoConstraints = false
            label.isUserInteractionEnabled = false
            label.leadingAnchor.constraint(equalTo: datePickButton.leadingAnchor).isActive = true
            label.topAnchor.constraint(equalTo: datePickButton.topAnchor).isActive = true
            label.bottomAnchor.constraint(equalTo: datePickButton.bottomAnchor).isActive = true

            label.font = .systemFont(ofSize: 24, weight: .bold)
            label.textColor = .stGreen40
        }
    }

    private func setupDoneButton() {
        addSubview(doneButton)
        doneButton.translatesAutoresizingMaskIntoConstraints = false
        doneButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Layout.LowerButton.sideMargin).isActive = true
        doneButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -Layout.bottomMargin).isActive = true
        doneButton.widthAnchor.constraint(equalToConstant: Layout.LowerButton.width).isActive = true
        doneButton.heightAnchor.constraint(equalToConstant: Layout.LowerButton.height).isActive = true
        doneButton.addTarget(self, action: #selector(didTapDoneButton(_:)), for: .touchUpInside)

        doneButton.backgroundColor = .stOrange40
        doneButton.layer.cornerRadius = Layout.LowerButton.cornerRadius

        guard let label = doneButton.titleLabel else { return }
        label.font = .systemFont(ofSize: Layout.LowerButton.fontSize, weight: Layout.LowerButton.weight)
        label.textColor = .stCoolGray00
        let attrString = NSMutableAttributedString(string: "완료")
        let range = NSRange(location: 0, length: attrString.length)
        attrString.addAttribute(.kern, value: Layout.letterSpacing, range: range)
        doneButton.setAttributedTitle(attrString, for: .normal)
    }

    private func setupCancelButton() {
        addSubview(cancelButton)
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        cancelButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Layout.LowerButton.sideMargin).isActive = true
        cancelButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -Layout.bottomMargin).isActive = true
        cancelButton.widthAnchor.constraint(equalToConstant: Layout.LowerButton.width).isActive = true
        cancelButton.heightAnchor.constraint(equalToConstant: Layout.LowerButton.height).isActive = true
        cancelButton.addTarget(self, action: #selector(didTapCancelButton(_:)), for: .touchUpInside)

        cancelButton.backgroundColor = .stCoolGray20
        cancelButton.layer.cornerRadius = Layout.LowerButton.cornerRadius

        guard let label = cancelButton.titleLabel else { return }
        label.font = .systemFont(ofSize: Layout.LowerButton.fontSize, weight: Layout.LowerButton.weight)
        label.textColor = .stCoolGray70
        let attrString = NSMutableAttributedString(string: "취소")
        let range = NSRange(location: 0, length: attrString.length)
        attrString.addAttribute(.kern, value: Layout.letterSpacing, range: range)
        cancelButton.setAttributedTitle(attrString, for: .normal)
    }



    @objc
    private func didTapDoneButton(_ sender: UIButton) {
        delegate?.didTapDoneButton()
    }

    @objc
    private func didTapCancelButton(_ sender: UIButton) {
        delegate?.didTapCancelButton()
    }

    @objc
    private func didTapSelectMountainButton(_ sender: UIButton) {
        delegate?.didTapSelectMountainButton()
    }

    @objc
    private func didTapDatePickButton(_ sender: UIButton) {
        delegate?.didTapDatePickButton()
    }

    func updateMountainNameLabel(with mountain: Mountain?) {
        guard let mountain = mountain, let name = mountain.name else { return }
        mountainNamePlaceholderView.isHidden = true
        mountainNameLine.backgroundColor = .stGreen40
        let peak = mountain.peak ?? ""

        let str = "\(name) \(peak)"
        let nsStr = str as NSString
        let attrString = NSMutableAttributedString(string: str)
        let range = NSRange(location: 0, length: attrString.length)
        let nameRange = nsStr.range(of: name)
        let peakRange = nsStr.range(of: peak)
        attrString.addAttribute(.kern, value: Layout.letterSpacing, range: range)
        attrString.addAttribute(.font, value: UIFont.systemFont(ofSize: 24, weight: .bold), range: nameRange)
        attrString.addAttribute(.font, value: UIFont.systemFont(ofSize: 24, weight: .semibold), range: peakRange)
        mountainNameLabel.attributedText = attrString
    }

    func updateDateLabel(with str: String) {
        datePickPlaceholderView.isHidden = true
        dateLine.backgroundColor = .stGreen40
        
        let attrString = NSMutableAttributedString(string: str)
        let range = NSRange(location: 0, length: attrString.length)
        attrString.addAttribute(.kern, value: Layout.letterSpacing, range: range)
        dateLabel.attributedText = attrString
    }
}

extension AddHistoryView {
    private enum Layout {
        static let topMargin: CGFloat = 58
        static let bottomMargin: CGFloat = 40
        static let sideMargin: CGFloat = 32

        static let letterSpacing: CGFloat = -0.04

        enum Title {
            static let leadingMargin: CGFloat = 24
            static let topMargin: CGFloat = 36
            static let fontSize: CGFloat = 32
            static let lineSpacing: CGFloat = fontSize * 0.4
            static let weight = UIFont.Weight(700)
        }

        enum LowerButton {
            static let sideMargin: CGFloat = 20
            static let width: CGFloat = 163
            static let height: CGFloat = 48
            static let cornerRadius: CGFloat = 12
            static let fontSize: CGFloat = 16
            static let weight = UIFont.Weight(700)
        }


    }
}
