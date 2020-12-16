


protocol EnumSwitchCMDP: EnumCMDP {}

extension EnumSwitchCMDP {
    
    /// Generates a switch for an enum
    /// - if withStoredValue is true - inserts a word "return" after each case.
    /// Use this for returning some value (not stored object) for each case
    ///
    /// - if withStoredValue is false - inserts "(let a)" at each case, and word "return a" after each case.
    /// Use this for enums which have nested enums, and you can get a generic child object (probably using a common protocol for all of them)
    /// - if selectTheInsertion is true - will select the inserted code after pasting
    func generateSwitch(_ invoc: XCInvocation,
                        withStoredValue: Bool,
                        selectTheInsertion: Bool = false) {
        
        let buffer = invoc.buffer
        
        guard let lineIdx = buffer.lastSelectedLineIdx,
              let caseStrs = parseCasesFromSelection(in: buffer) else {
            return
        }
        
        let str = generateSwitch(fromCases: caseStrs,
                                 usesTabs: buffer.usesTabsForIndentation,
                                 tabWidth: invoc.tabWidth,
                                 withStoredValue: withStoredValue)
        invoc.insert(str, after: lineIdx + 2)

        if selectTheInsertion {
            invoc.selectLines(startIndex: lineIdx + 2,
                              endIndex: lineIdx + 2 * caseStrs.count + 4)
        }
    }
}
