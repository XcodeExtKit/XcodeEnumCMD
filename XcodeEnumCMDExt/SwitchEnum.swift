


@_exported import XcodeExtBase


/// generates a switch for any enum by inserting word "return" after each case
/// Use this for returning some value for each case (not stored object)
class SwitchEnum: BaseCMD, EnumSwitchCMDP {

    override func exec(with invoc: XCInvocation) {
        generateSwitch(invoc, withStoredValue: false)
    }
}

/// generates a switch for any enum by inserting "(let a)" at each case, and word "return a" after each case
/// Use this for enums which have nested enums, and you can get a generic child object (probably using a common protocol for all of them)
class SwitchEnumWithValue: BaseCMD, EnumSwitchCMDP {

    override func exec(with invoc: XCInvocation) {
        generateSwitch(invoc, withStoredValue: true)
    }
}


