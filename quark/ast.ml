module T = Type

type binop =
  | Add 
  | Sub 
  | Mul
  | Div 
  | Mod
  | Pow
  | Lshift 
  | Rshift
  | Less 
  | LessEq 
  | Greater
  | GreaterEq 
  | Eq 
  | NotEq
  | BitAnd 
  | BitXor 
  | BitOr 
  | And
  | Or
  | AddEq
  | SubEq
  | MulEq
  | DivEq
  | AndEq
  | Query
  | QueryUnreal

type unop = 
  | Neg 
  | Not 
  | BitNot

type postop = 
  | Dec 
  | Inc

type datatype = 
  | DataType of T.vartype
  | ArrayType of datatype
  | MatrixType of datatype

type ident = Ident of string

type lvalue =
  | Variable of ident
  | ArrayElem of ident * expr list

and expr =
  | Binop of expr * binop * expr
  | AssignOp of lvalue * binop * expr
  | Unop of unop * expr
  | PostOp of lvalue * postop
  | Assign of lvalue * expr
  | IntLit of string
  | BoolLit of string
  | FractionLit of expr * expr
  | QRegLit of expr * expr
  | FloatLit of string
  | StringLit of string
  | ArrayLit of expr list
  | MatrixLit of expr list list
  | ComplexLit of expr * expr
  | Lval of lvalue
  | Membership of expr * expr
  | FunctionCall of ident * expr list

type decl =
  | PrimitiveDecl of datatype * ident
  | AssigningDecl of datatype * ident * expr

type range = Range of expr * expr * expr

type iterator =
  | RangeIterator of ident * range
  | ArrayIterator of ident * expr

type statement =
  | CompoundStatement of statement list
  | Declaration of decl
  | Expression of expr
  | EmptyStatement
  | IfStatement of expr * statement * statement
  | WhileStatement of expr * statement
  | ForStatement of iterator * statement
  | FunctionDecl of datatype * ident * decl list * statement list
  | ForwardDecl of datatype * ident * decl list
  | ReturnStatement of expr
  | VoidReturnStatement
  | BreakStatement
  | ContinueStatement
