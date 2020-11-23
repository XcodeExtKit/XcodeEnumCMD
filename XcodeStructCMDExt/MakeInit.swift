

@_exported import XcodeExtBase



//TODO: consider making BaseTypeCMD or protocol ext - to share
class MakeInit: BaseCMD {
    
    override func exec(with invoc: XCInvocation) {
        
        let b = invoc.buffer
        
        if let selectedLines = b.selectedLines,
           let str = generateInitDecl(propertyLines: selectedLines,
                                      tabIndent: b.indentationWidth,
                                      usesTabs: b.usesTabsForIndentation) {
            b.addAtTheBottom(str)
        }
    }
    
    /// extracts properties from lines (var / let) and uses them to generate init
    /// returns nil - if no properties were found
    func generateInitDecl(propertyLines: [Str],
                          tabIndent: Int,
                          usesTabs: Bool) -> Str? {
        
        //TODO:
        // dash is not parsed !
        // add var optional
        
        guard let args = parseArgs(propertyLines) else {
            return nil
        }
        return makeInitDecl(args, optional: false, usesTabs: usesTabs, tabIndent: tabIndent)
    }
}
