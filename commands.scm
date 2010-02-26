; Dummy methods that haven't been implemented yet
(define (get-string command args)
  (display "WARNING: get-string hasn't been implemented yet\n"))

(define (get-string-array)
  (display "WARNING: get-string-array hasn't been implemented yet\n"))

(define (get-boolean command args)
  (display "WARNING: get-boolean hasn't been implemented yet\n"))

(define (get-number command args)
  (display "WARNING: get-number hasn't been implemented yet\n"))

; Real methods below

(define (start-browser browser start-url)
  (let ((result (do-command "getNewBrowserSession" (list browser start-url))))
    (set! current-session-string (string-append "&sessionId="
                                                (prune-body (table-ref result 'body))))))

(define (open-url url)
  (do-command "open" (list url)))

(define (stop-browser)
  (do-command "testComplete" '()))

(define (click locator)
  (do-command "click" (list locator)))

(define (wait-for-page-to-load timeout)
  (do-command "waitForPageToLoad" (list (number->string timeout))))

(define (double-click locator)
  (do-command "doubleClick" (list locator)))

(define (type locator value)
  (do-command "type" (list locator value)))

(define (double-click locator)
  (do-command "doubleClick" (list locator)))

(define (context-menu locator)
  (do-command "contextMenu" (list locator)))

(define (click-at locator coordinates)
  (do-command "clickAt" (list locator coordinates)))

(define (double-click-at locator coordinates)
  (do-command "doubleClickAt" (list locator coordinates)))

(define (context-menu-at locator coordinates)
  (do-command "contextMenuAt" (list locator coordinates)))

(define (fire-event locator event-name)
  (do-command "fireEvent" (list locator event-name)))

(define (focus locator)
  (do-command "focus" (list locator)))

(define (key-press locator key-sequence)
  (do-command "keyPress" (list locator key-sequence)))

(define (shift-key-down)
  (do-command "shiftKeyDown" '()))

(define (shift-key-up)
  (do-command "shiftKeyUp" '()))

(define (meta-key-down)
  (do-command "metaKeyDown" '()))

(define (meta-key-up)
  (do-command "metaKeyUp" '()))

(define (alt-key-down)
  (do-command "altKeyDown" '()))

(define (alt-key-up)
  (do-command "altKeyUp" '()))

(define (control-key-down)
  (do-command "controlKeyDown" '()))

(define (control-key-up)
  (do-command "controlKeyUp" '()))

(define (key-down locator key-sequence)
  (do-command "keyDown" (list locator key-sequence)))

(define (key-up locator key-sequence)
  (do-command "keyUp" (list locator key-sequence)))

(define (mouse-over locator)
  (do-command  "mouseOver" (list locator)))

(define (mouse-out locator)
  (do-command  "mouseOut" (list locator)))

(define (mouse-down locator)
  (do-command  "mouseDown" (list locator)))

(define (mouse-down-at locator coordString)
  (do-command  "mouseDownAt" (list locator coordString)))

(define (mouse-up locator)
  (do-command  "mouseUp" (list locator)))

(define (mouse-up-at locator coordString)
  (do-command  "mouseUpAt" (list locator coordString)))

(define (mouse-move locator)
  (do-command  "mouseMove" (list locator)))

(define (mouse-move-at locator coordString)
  (do-command  "mouseMoveAt" (list locator coordString)))

(define (type locator value)
  (do-command  "type" (list locator value)))

(define (type-keys locator value)
  (do-command  "typeKeys" (list locator value)))

(define (set-speed value)
  (do-command  "setSpeed" (list value)))

(define (get-speed )
  (get-string "getSpeed" '()))

(define (check locator)
  (do-command  "check" (list locator)))

(define (uncheck locator)
  (do-command  "uncheck" (list locator)))

(define (select selectLocator optionLocator)
  (do-command  "select" (list selectLocator optionLocator)))

(define (add-selection locator optionLocator)
  (do-command  "addSelection" (list locator optionLocator)))

(define (remove-selection locator optionLocator)
  (do-command  "removeSelection" (list locator optionLocator)))

(define (remove-all-selections locator)
  (do-command  "removeAllSelections" (list locator)))

(define (submit formLocator)
  (do-command  "submit" (list formLocator)))

(define (open url)
  (do-command  "open" (list url)))

(define (open-window url windowID)
  (do-command  "openWindow" (list url windowID)))

(define (select-window windowID)
  (do-command  "selectWindow" (list windowID)))

(define (select-frame locator)
  (do-command  "selectFrame" (list locator)))

(define (get-whether-this-frame-match-frame-expression currentFrameString target)
  (get-boolean "getWhetherThisFrameMatchFrameExpression" (list currentFrameString target)))

(define (get-whether-this-window-match-window-expression currentWindowString target)
  (get-boolean "getWhetherThisWindowMatchWindowExpression" (list currentWindowString target)))

(define (wait-for-pop-up windowID timeout)
  (do-command  "waitForPopUp" (list windowID timeout)))

(define (choose-cancel-on-next-confirmation )
  (do-command  "chooseCancelOnNextConfirmation" '()))

(define (choose-ok-on-next-confirmation )
  (do-command  "chooseOkOnNextConfirmation" '()))

(define (answer-on-next-prompt answer)
  (do-command  "answerOnNextPrompt" (list answer)))

(define (go-back )
  (do-command  "goBack" '()))

(define (refresh )
  (do-command  "refresh" '()))

(define (close )
  (do-command  "close" '()))

(define (is-alert-present )
  (get-boolean "isAlertPresent" '()))

(define (is-prompt-present )
  (get-boolean "isPromptPresent" '()))

(define (is-confirmation-present )
  (get-boolean "isConfirmationPresent" '()))

(define (get-alert )
  (get-string "getAlert" '()))

(define (get-confirmation )
  (get-string "getConfirmation" '()))

(define (get-prompt )
  (get-string "getPrompt" '()))

(define (get-location )
  (get-string "getLocation" '()))

(define (get-title )
  (get-string "getTitle" '()))

(define (get-body-text )
  (get-string "getBodyText" '()))

(define (get-value locator)
  (get-string "getValue" (list locator)))

(define (get-text locator)
  (get-string "getText" (list locator)))

(define (highlight locator)
  (do-command  "highlight" (list locator)))

(define (get-eval script)
  (get-string "getEval" (list script)))

(define (is-checked locator)
  (get-boolean "isChecked" (list locator)))

(define (get-table tableCellAddress)
  (get-string "getTable" (list tableCellAddress)))

(define (get-selected-labels selectLocator)
  (get-string-array "getSelectedLabels" (list selectLocator)))

(define (get-selected-label selectLocator)
  (get-string "getSelectedLabel" (list selectLocator)))

(define (get-selected-values selectLocator)
  (get-string-array "getSelectedValues" (list selectLocator)))

(define (get-selected-value selectLocator)
  (get-string "getSelectedValue" (list selectLocator)))

(define (get-selected-indexes selectLocator)
  (get-string-array "getSelectedIndexes" (list selectLocator)))

(define (get-selected-index selectLocator)
  (get-string "getSelectedIndex" (list selectLocator)))

(define (get-selected-ids selectLocator)
  (get-string-array "getSelectedIds" (list selectLocator)))

(define (get-selected-id selectLocator)
  (get-string "getSelectedId" (list selectLocator)))

(define (is-something-selected selectLocator)
  (get-boolean "isSomethingSelected" (list selectLocator)))

(define (get-select-options selectLocator)
  (get-string-array "getSelectOptions" (list selectLocator)))

(define (get-attribute attributeLocator)
  (get-string "getAttribute" (list attributeLocator)))

(define (is-text-present pattern)
  (get-boolean "isTextPresent" (list pattern)))

(define (is-element-present locator)
  (get-boolean "isElementPresent" (list locator)))

(define (is-visible locator)
  (get-boolean "isVisible" (list locator)))

(define (is-editable locator)
  (get-boolean "isEditable" (list locator)))

(define (get-all-buttons )
  (get-string-array "getAllButtons" '()))

(define (get-all-links )
  (get-string-array "getAllLinks" '()))

(define (get-all-fields )
  (get-string-array "getAllFields" '()))

(define (get-attribute-from-all-windows attributeName)
  (get-string-array "getAttributeFromAllWindows" (list attributeName)))

(define (dragdrop locator movementsString)
  (do-command  "dragdrop" (list locator movementsString)))

(define (set-mouse-speed pixels)
  (do-command  "setMouseSpeed" (list pixels)))

(define (get-mouse-speed )
  (get-number "getMouseSpeed" '()))

(define (drag-and-drop locator movementsString)
  (do-command  "dragAndDrop" (list locator movementsString)))

(define (drag-and-drop-to-object locatorOfObjectToBeDragged locatorOfDragDestinationObject)
  (do-command  "dragAndDropToObject" (list locatorOfObjectToBeDragged locatorOfDragDestinationObject)))

(define (window-focus )
  (do-command  "windowFocus" '()))

(define (window-maximize )
  (do-command  "windowMaximize" '()))

(define (get-all-window-ids )
  (get-string-array "getAllWindowIds" '()))

(define (get-all-window-names )
  (get-string-array "getAllWindowNames" '()))

(define (get-all-window-titles )
  (get-string-array "getAllWindowTitles" '()))

(define (get-html-source )
  (get-string "getHtmlSource" '()))

(define (set-cursor-position locator position)
  (do-command  "setCursorPosition" (list locator position)))

(define (get-element-index locator)
  (get-number "getElementIndex" (list locator)))

(define (is-ordered locator1 locator2)
  (get-boolean "isOrdered" (list locator1 locator2)))

(define (get-element-position-left locator)
  (get-number "getElementPositionLeft" (list locator)))

(define (get-element-position-top locator)
  (get-number "getElementPositionTop" (list locator)))

(define (get-element-width locator)
  (get-number "getElementWidth" (list locator)))

(define (get-element-height locator)
  (get-number "getElementHeight" (list locator)))

(define (get-cursor-position locator)
  (get-number "getCursorPosition" (list locator)))

(define (get-expression expression)
  (get-string "getExpression" (list expression)))

(define (get-xpath-count xpath)
  (get-number "getXpathCount" (list xpath)))

(define (assign-id locator identifier)
  (do-command  "assignId" (list locator identifier)))

(define (allow-native-xpath allow)
  (do-command  "allowNativeXpath" (list allow)))

(define (ignore-attributes-without-value ignore)
  (do-command  "ignoreAttributesWithoutValue" (list ignore)))

(define (wait-for-condition script timeout)
  (do-command  "waitForCondition" (list script timeout)))

(define (set-timeout timeout)
  (do-command  "setTimeout" (list timeout)))

(define (wait-for-frame-to-load frameAddress timeout)
  (do-command  "waitForFrameToLoad" (list frameAddress (number->string timeout))))

(define (get-cookie )
  (get-string "getCookie" '()))

(define (get-cookie-by-name name)
  (get-string "getCookieByName" (list name)))

(define (is-cookie-present name)
  (get-boolean "isCookiePresent" (list name)))

(define (create-cookie nameValuePair optionsString)
  (do-command  "createCookie" (list nameValuePair optionsString)))

(define (delete-cookie name optionsString)
  (do-command  "deleteCookie" (list name optionsString)))

(define (delete-all-visible-cookies )
  (do-command  "deleteAllVisibleCookies" '()))

(define (set-browser-log-level logLevel)
  (do-command  "setBrowserLogLevel" (list logLevel)))

(define (run-script script)
  (do-command  "runScript" (list script)))

(define (add-location-strategy strategyName functionDefinition)
  (do-command  "addLocationStrategy" (list strategyName functionDefinition)))

(define (capture-entire-page-screenshot filename)
  (do-command  "captureEntirePageScreenshot" (list filename)))

(define (set-context context)
  (do-command  "setContext" (list context)))

(define (attach-file fieldLocator fileLocator)
  (do-command  "attachFile" (list fieldLocator fileLocator)))

(define (capture-screenshot filename)
  (do-command  "captureScreenshot" (list filename)))

(define (shut-down-selenium-server )
  (do-command  "shutDownSeleniumServer" '()))

(define (key-down-native keycode)
  (do-command  "keyDownNative" (list keycode)))

(define (key-up-native keycode)
  (do-command  "keyUpNative" (list keycode)))

(define (key-press-native keycode)
  (do-command  "keyPressNative" (list keycode)))
