//
// TextFieldValidationTests.swift
//  TVING_CloneTests
//
//  Created by 성현주 on 5/4/25.
//

import XCTest
@testable import TVING_Clone

final class TextFieldBooleanAssertionTests: XCTestCase {

    // MARK: - 1. 기본 조건 테스트

    func test_textField_isValidShouldBeFalseWhenEmptyAndRequiresNonEmpty() {
        let textField = TextField()
        textField.validationType = [.nonEmpty]

        textField.text = ""
        XCTAssertFalse(textField.isValid)
    }

    func test_textField_isValidShouldBeTrueWhenNonEmpty() {
        let textField = TextField()
        textField.validationType = [.nonEmpty]

        textField.text = "content"
        XCTAssertTrue(textField.isValid)
    }

    // MARK: - 2. minLength 단독 & 복합 조합 테스트

    func test_textField_isValidShouldBeFalseWhenTooShortWithMinLength() {
        let textField = TextField()
        textField.validationType = [.minLength(6)]

        textField.text = "12345"
        XCTAssertFalse(textField.isValid)
    }

    func test_textField_isValidShouldBeTrueWhenMeetsMinLength() {
        let textField = TextField()
        textField.validationType = [.minLength(6)]

        textField.text = "123456"
        XCTAssertTrue(textField.isValid)
    }

    func test_textField_isValidShouldBeFalseWhenNonEmptyAndMinLengthButTooShort() {
        let textField = TextField()
        textField.validationType = [.nonEmpty, .minLength(10)]

        textField.text = "short"
        XCTAssertFalse(textField.isValid)
    }

    func test_textField_isValidShouldBeTrueWhenValidNonEmptyAndMinLength() {
        let textField = TextField()
        textField.validationType = [.nonEmpty, .minLength(10)]

        textField.text = "longenough"
        XCTAssertTrue(textField.isValid)
    }

    // MARK: - 3. 이메일 유효성 테스트

    func test_textField_isValidShouldBeFalseForInvalidEmail() {
        let textField = TextField()
        textField.validationType = [.email]

        textField.text = "abc.com"
        XCTAssertFalse(textField.isValid)
    }

    func test_textField_isValidShouldBeTrueForValidEmail() {
        let textField = TextField()
        textField.validationType = [.email]

        textField.text = "test@ssu.ac.kr"
        XCTAssertTrue(textField.isValid)
    }

    // MARK: - 4. 한글만 허용하는 닉네임 필드 테스트

    func test_textField_isValidShouldBeTrueForKoreanOnly() {
        let textField = TextField()
        textField.validationType = [.koreanOnly]

        textField.text = "홍길동"
        XCTAssertTrue(textField.isValid)
    }

    func test_textField_isValidShouldBeFalseWhenKoreanOnlyButIncludesEnglish() {
        let textField = TextField()
        textField.validationType = [.koreanOnly]

        textField.text = "홍Gil동"
        XCTAssertFalse(textField.isValid)
    }

    // MARK: - 5. 상태 변화 반응성 테스트 (textDidChange)

    func test_textFieldValidityShouldChangeWhenTextChanges() {
        let textField = TextField()
        textField.validationType = [.nonEmpty]

        class DummyDelegate: TextFieldValidatingDelegate {
            var wasCalled = false
            func textFieldValidityDidChange() { wasCalled = true }
        }

        let delegate = DummyDelegate()
        textField.validationDelegate = delegate

        textField.text = "new"
        textField.sendActions(for: .editingChanged)

        XCTAssertTrue(delegate.wasCalled)
    }

    // MARK: - 6. 초기 상태가 비어있는 경우

    func test_textField_isValidShouldBeFalseWhenInitialTextIsNil() {
        let textField = TextField()
        textField.validationType = [.nonEmpty]

        XCTAssertFalse(textField.isValid)
    }
}
