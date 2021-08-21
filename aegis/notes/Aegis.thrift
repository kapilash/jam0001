namespace netstd AegisCore
namespace rs aegis_core


enum AValueType {
  AVARIABLE = 0
  AINTEGRAL = 1
  AFLOATING = 2
  ACHARACTER = 3
  ALABEL = 4
  ASTRCONST = 5
  ABYTECONST = 6
  ABOOLCONST = 7
}
struct AVar {
  1: string    name
}

struct ALabel {
  1: string name
}

struct AIntegral {
  1: i64 constValue
}

struct AFloating {
  1: double constValue
}
struct AChar {
  1: i64 constValue
}

struct AStr {
  1: string constValue
}

struct ABool {
  1: bool constValue
}

struct AByte {
  1: i8 constValue
}

enum AOper {
  ATILDE = 0
  ABACKQUOTE = 1
  AEXCLAMATION = 2
  AAT = 3
  AHASH = 4
  ADOLLAR = 5
  APERCENT = 6
  ACAP = 7
  AAND = 8
  AASTERISK = 9
  AMINUS = 10
  APLUS = 11
  AEQ = 12
  ALT = 13
  AGT = 14
  AQM = 15
  ADOT = 16
  ADIV = 17
  ALE = 18
  AGE = 19
  AEE = 20
}

union ASimple {
  1: AVar variable,
  2: ALabel label
  3: AIntegral integralConst
  4: AStr strConst
  5: AChar charConst
  6: AFloating doubleConst
  7: ABool booleanConst
  8: AByte byteConst
}

struct ABinary {
  1: AOper operat
  2: AExpr left
  3: AExpr right
}

struct AUnary {
  1: AOper operat
  2: AExpr left
}

struct AIfElse {
  1: AExpr check
  2: AExpr ifTrue
  3: AExpr ifNotTrue
}

struct AType {
  1: string name
  2: list<string> modulePath
}

struct AApp {
  1: AExpr funcExpr
  2: list<AExpr> arguments
}

struct ALet {
  1: list<AVar> names
  2: list<AType> types
  3: list<AExpr> values
  4: AExpr body
}

struct APattern {
  1: AExpr patCond
  2: AExpr patValue
}


struct ACase {
  1: list<APattern> arms
  2: AExpr defaultValue
}

struct AFieldAccess{
   1: AExpr source
   2: string field
}
struct ACollAccess {
   1: AExpr source
   2: AExpr offset
}

union AExpr {
  1: ASimple simpleExpr
  2: AUnary unaryExp
  3: ABinary binaryExp
  4: AApp funcall
  5: ALet letExpr
  6: ACase caseExpr
  7: AIfElse ite
  8: AFieldAccess fieldAcc
  9: ACollAccess collectionAcc
}

union ALValue {
  1: AVar lvar
  2: AFieldAccess lField
}

struct ADeclr {
  1: AVar variable
  2: AType varType
  3: AExpr initialValue
}


struct AAssign {
  1: ALValue lvalue
  2: AExpr rhs
}

struct ABlock {
  1: list<AStmt> statements
}

struct AIfStmt {
   1: AExpr cond
   2: list<AStmt> trueBlock
   3: list<AStmt> elseBlock
}

struct AWhile {
  1: AExpr cond
  2: list<AStmt> block
}

struct AFor {
  1: AVar variable
  2: AType varType
  3: AExpr initial
  4: AExpr incrment
  5: list<AStmt> block
}

union AStmt {
  1: AAssign assigment
  2: ADeclr declaration
  3: AIfStmt ifstmt
  4: AWhile whileLoop
  5: AFor forLoop
}

struct AMethod {
  1: string funcName
  2: list<string> params
  3: list<AType> paramTypes
  4: AType returnType
  5: list<AStmt> block
}

struct AStructField {
   1: string name
   2: AType type
   3: AExpr initValue
}
struct AStruct {
  1: string name
  2: list<AStructField> fields
}

struct AModule {
  1: list<AStruct> structures
  2: list<AMethod> methods
}
