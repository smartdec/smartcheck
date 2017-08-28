// Generated from C:/solidity-checker/src/main/antlr4/ru.smartdec.soliditycheck\Solidity.g4 by ANTLR 4.7
import org.antlr.v4.runtime.tree.ParseTreeVisitor;

/**
 * This interface defines a complete generic visitor for a parse tree produced
 * by {@link SolidityParser}.
 *
 * @param <T> The return type of the visit operation. Use {@link Void} for
 * operations with no return type.
 */
public interface SolidityVisitor<T> extends ParseTreeVisitor<T> {
	/**
	 * Visit a parse tree produced by {@link SolidityParser#sourceUnit}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitSourceUnit(SolidityParser.SourceUnitContext ctx);
	/**
	 * Visit a parse tree produced by {@link SolidityParser#pragmaDirective}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitPragmaDirective(SolidityParser.PragmaDirectiveContext ctx);
	/**
	 * Visit a parse tree produced by {@link SolidityParser#pragmaName}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitPragmaName(SolidityParser.PragmaNameContext ctx);
	/**
	 * Visit a parse tree produced by {@link SolidityParser#pragmaValue}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitPragmaValue(SolidityParser.PragmaValueContext ctx);
	/**
	 * Visit a parse tree produced by {@link SolidityParser#version}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitVersion(SolidityParser.VersionContext ctx);
	/**
	 * Visit a parse tree produced by {@link SolidityParser#versionOperator}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitVersionOperator(SolidityParser.VersionOperatorContext ctx);
	/**
	 * Visit a parse tree produced by {@link SolidityParser#versionConstraint}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitVersionConstraint(SolidityParser.VersionConstraintContext ctx);
	/**
	 * Visit a parse tree produced by {@link SolidityParser#importDeclaration}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitImportDeclaration(SolidityParser.ImportDeclarationContext ctx);
	/**
	 * Visit a parse tree produced by {@link SolidityParser#importDirective}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitImportDirective(SolidityParser.ImportDirectiveContext ctx);
	/**
	 * Visit a parse tree produced by {@link SolidityParser#contractDefinition}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitContractDefinition(SolidityParser.ContractDefinitionContext ctx);
	/**
	 * Visit a parse tree produced by {@link SolidityParser#inheritanceSpecifier}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitInheritanceSpecifier(SolidityParser.InheritanceSpecifierContext ctx);
	/**
	 * Visit a parse tree produced by {@link SolidityParser#contractPart}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitContractPart(SolidityParser.ContractPartContext ctx);
	/**
	 * Visit a parse tree produced by {@link SolidityParser#contractPartDefinition}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitContractPartDefinition(SolidityParser.ContractPartDefinitionContext ctx);
	/**
	 * Visit a parse tree produced by {@link SolidityParser#stateVariableDeclaration}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitStateVariableDeclaration(SolidityParser.StateVariableDeclarationContext ctx);
	/**
	 * Visit a parse tree produced by {@link SolidityParser#visibleType}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitVisibleType(SolidityParser.VisibleTypeContext ctx);
	/**
	 * Visit a parse tree produced by {@link SolidityParser#usingForDeclaration}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitUsingForDeclaration(SolidityParser.UsingForDeclarationContext ctx);
	/**
	 * Visit a parse tree produced by {@link SolidityParser#structDefinition}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitStructDefinition(SolidityParser.StructDefinitionContext ctx);
	/**
	 * Visit a parse tree produced by {@link SolidityParser#modifierDefinition}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitModifierDefinition(SolidityParser.ModifierDefinitionContext ctx);
	/**
	 * Visit a parse tree produced by {@link SolidityParser#functionDefinition}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitFunctionDefinition(SolidityParser.FunctionDefinitionContext ctx);
	/**
	 * Visit a parse tree produced by {@link SolidityParser#functionFallBackDefinition}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitFunctionFallBackDefinition(SolidityParser.FunctionFallBackDefinitionContext ctx);
	/**
	 * Visit a parse tree produced by {@link SolidityParser#functionFallBackCall}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitFunctionFallBackCall(SolidityParser.FunctionFallBackCallContext ctx);
	/**
	 * Visit a parse tree produced by {@link SolidityParser#eventDefinition}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitEventDefinition(SolidityParser.EventDefinitionContext ctx);
	/**
	 * Visit a parse tree produced by {@link SolidityParser#enumDefinition}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitEnumDefinition(SolidityParser.EnumDefinitionContext ctx);
	/**
	 * Visit a parse tree produced by {@link SolidityParser#enumValue}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitEnumValue(SolidityParser.EnumValueContext ctx);
	/**
	 * Visit a parse tree produced by {@link SolidityParser#indexedParameterList}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitIndexedParameterList(SolidityParser.IndexedParameterListContext ctx);
	/**
	 * Visit a parse tree produced by {@link SolidityParser#parameterList}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitParameterList(SolidityParser.ParameterListContext ctx);
	/**
	 * Visit a parse tree produced by {@link SolidityParser#parameter}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitParameter(SolidityParser.ParameterContext ctx);
	/**
	 * Visit a parse tree produced by {@link SolidityParser#typeNameList}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitTypeNameList(SolidityParser.TypeNameListContext ctx);
	/**
	 * Visit a parse tree produced by {@link SolidityParser#variableDeclaration}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitVariableDeclaration(SolidityParser.VariableDeclarationContext ctx);
	/**
	 * Visit a parse tree produced by {@link SolidityParser#variableDeclarationList}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitVariableDeclarationList(SolidityParser.VariableDeclarationListContext ctx);
	/**
	 * Visit a parse tree produced by {@link SolidityParser#typeName}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitTypeName(SolidityParser.TypeNameContext ctx);
	/**
	 * Visit a parse tree produced by {@link SolidityParser#userDefinedTypeName}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitUserDefinedTypeName(SolidityParser.UserDefinedTypeNameContext ctx);
	/**
	 * Visit a parse tree produced by {@link SolidityParser#mappingSt}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitMappingSt(SolidityParser.MappingStContext ctx);
	/**
	 * Visit a parse tree produced by {@link SolidityParser#functionTypeName}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitFunctionTypeName(SolidityParser.FunctionTypeNameContext ctx);
	/**
	 * Visit a parse tree produced by {@link SolidityParser#storageLocation}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitStorageLocation(SolidityParser.StorageLocationContext ctx);
	/**
	 * Visit a parse tree produced by {@link SolidityParser#blockCall}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitBlockCall(SolidityParser.BlockCallContext ctx);
	/**
	 * Visit a parse tree produced by {@link SolidityParser#block}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitBlock(SolidityParser.BlockContext ctx);
	/**
	 * Visit a parse tree produced by {@link SolidityParser#statement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitStatement(SolidityParser.StatementContext ctx);
	/**
	 * Visit a parse tree produced by {@link SolidityParser#expressionStatement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitExpressionStatement(SolidityParser.ExpressionStatementContext ctx);
	/**
	 * Visit a parse tree produced by {@link SolidityParser#ifStatement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitIfStatement(SolidityParser.IfStatementContext ctx);
	/**
	 * Visit a parse tree produced by {@link SolidityParser#ifCondition}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitIfCondition(SolidityParser.IfConditionContext ctx);
	/**
	 * Visit a parse tree produced by {@link SolidityParser#whileStatement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitWhileStatement(SolidityParser.WhileStatementContext ctx);
	/**
	 * Visit a parse tree produced by {@link SolidityParser#placeholderStatement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitPlaceholderStatement(SolidityParser.PlaceholderStatementContext ctx);
	/**
	 * Visit a parse tree produced by {@link SolidityParser#simpleStatement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitSimpleStatement(SolidityParser.SimpleStatementContext ctx);
	/**
	 * Visit a parse tree produced by {@link SolidityParser#forStatement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitForStatement(SolidityParser.ForStatementContext ctx);
	/**
	 * Visit a parse tree produced by {@link SolidityParser#inlineAssemblyStatement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitInlineAssemblyStatement(SolidityParser.InlineAssemblyStatementContext ctx);
	/**
	 * Visit a parse tree produced by {@link SolidityParser#doWhileStatement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitDoWhileStatement(SolidityParser.DoWhileStatementContext ctx);
	/**
	 * Visit a parse tree produced by {@link SolidityParser#continueStatement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitContinueStatement(SolidityParser.ContinueStatementContext ctx);
	/**
	 * Visit a parse tree produced by {@link SolidityParser#breakStatement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitBreakStatement(SolidityParser.BreakStatementContext ctx);
	/**
	 * Visit a parse tree produced by {@link SolidityParser#returnStatement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitReturnStatement(SolidityParser.ReturnStatementContext ctx);
	/**
	 * Visit a parse tree produced by {@link SolidityParser#throwStatement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitThrowStatement(SolidityParser.ThrowStatementContext ctx);
	/**
	 * Visit a parse tree produced by {@link SolidityParser#variableDeclarationStatement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitVariableDeclarationStatement(SolidityParser.VariableDeclarationStatementContext ctx);
	/**
	 * Visit a parse tree produced by {@link SolidityParser#identifierList}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitIdentifierList(SolidityParser.IdentifierListContext ctx);
	/**
	 * Visit a parse tree produced by {@link SolidityParser#identifier}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitIdentifier(SolidityParser.IdentifierContext ctx);
	/**
	 * Visit a parse tree produced by {@link SolidityParser#elementaryTypeName}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitElementaryTypeName(SolidityParser.ElementaryTypeNameContext ctx);
	/**
	 * Visit a parse tree produced by {@link SolidityParser#creatingContractViaNewStatement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitCreatingContractViaNewStatement(SolidityParser.CreatingContractViaNewStatementContext ctx);
	/**
	 * Visit a parse tree produced by {@link SolidityParser#expression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitExpression(SolidityParser.ExpressionContext ctx);
	/**
	 * Visit a parse tree produced by {@link SolidityParser#binaryOperator}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitBinaryOperator(SolidityParser.BinaryOperatorContext ctx);
	/**
	 * Visit a parse tree produced by {@link SolidityParser#comparison}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitComparison(SolidityParser.ComparisonContext ctx);
	/**
	 * Visit a parse tree produced by {@link SolidityParser#primaryExpression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitPrimaryExpression(SolidityParser.PrimaryExpressionContext ctx);
	/**
	 * Visit a parse tree produced by {@link SolidityParser#tupleExpression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitTupleExpression(SolidityParser.TupleExpressionContext ctx);
	/**
	 * Visit a parse tree produced by {@link SolidityParser#expressionList}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitExpressionList(SolidityParser.ExpressionListContext ctx);
	/**
	 * Visit a parse tree produced by {@link SolidityParser#nameValueList}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitNameValueList(SolidityParser.NameValueListContext ctx);
	/**
	 * Visit a parse tree produced by {@link SolidityParser#functionCall}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitFunctionCall(SolidityParser.FunctionCallContext ctx);
	/**
	 * Visit a parse tree produced by {@link SolidityParser#internalFunctionCall}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitInternalFunctionCall(SolidityParser.InternalFunctionCallContext ctx);
	/**
	 * Visit a parse tree produced by {@link SolidityParser#externalFunctionCall}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitExternalFunctionCall(SolidityParser.ExternalFunctionCallContext ctx);
	/**
	 * Visit a parse tree produced by {@link SolidityParser#externalFunctionCallThis}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitExternalFunctionCallThis(SolidityParser.ExternalFunctionCallThisContext ctx);
	/**
	 * Visit a parse tree produced by {@link SolidityParser#externalFunctionCallNotThis}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitExternalFunctionCallNotThis(SolidityParser.ExternalFunctionCallNotThisContext ctx);
	/**
	 * Visit a parse tree produced by {@link SolidityParser#callObject}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitCallObject(SolidityParser.CallObjectContext ctx);
	/**
	 * Visit a parse tree produced by {@link SolidityParser#functionCallStatement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitFunctionCallStatement(SolidityParser.FunctionCallStatementContext ctx);
	/**
	 * Visit a parse tree produced by {@link SolidityParser#functionCallArguments}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitFunctionCallArguments(SolidityParser.FunctionCallArgumentsContext ctx);
	/**
	 * Visit a parse tree produced by {@link SolidityParser#functionName}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitFunctionName(SolidityParser.FunctionNameContext ctx);
	/**
	 * Visit a parse tree produced by {@link SolidityParser#functionCallArgument}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitFunctionCallArgument(SolidityParser.FunctionCallArgumentContext ctx);
	/**
	 * Visit a parse tree produced by {@link SolidityParser#newExpression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitNewExpression(SolidityParser.NewExpressionContext ctx);
	/**
	 * Visit a parse tree produced by {@link SolidityParser#inlineAssemblyBlock}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitInlineAssemblyBlock(SolidityParser.InlineAssemblyBlockContext ctx);
	/**
	 * Visit a parse tree produced by {@link SolidityParser#assemblyItem}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitAssemblyItem(SolidityParser.AssemblyItemContext ctx);
	/**
	 * Visit a parse tree produced by {@link SolidityParser#assemblyItemCase}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitAssemblyItemCase(SolidityParser.AssemblyItemCaseContext ctx);
	/**
	 * Visit a parse tree produced by {@link SolidityParser#assemblyItemDefault}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitAssemblyItemDefault(SolidityParser.AssemblyItemDefaultContext ctx);
	/**
	 * Visit a parse tree produced by {@link SolidityParser#assemblyItemSwitch}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitAssemblyItemSwitch(SolidityParser.AssemblyItemSwitchContext ctx);
	/**
	 * Visit a parse tree produced by {@link SolidityParser#assemblyLocalBinding}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitAssemblyLocalBinding(SolidityParser.AssemblyLocalBindingContext ctx);
	/**
	 * Visit a parse tree produced by {@link SolidityParser#assemblyAssignment}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitAssemblyAssignment(SolidityParser.AssemblyAssignmentContext ctx);
	/**
	 * Visit a parse tree produced by {@link SolidityParser#assemblerFor}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitAssemblerFor(SolidityParser.AssemblerForContext ctx);
	/**
	 * Visit a parse tree produced by {@link SolidityParser#functionalAssemblyExpression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitFunctionalAssemblyExpression(SolidityParser.FunctionalAssemblyExpressionContext ctx);
	/**
	 * Visit a parse tree produced by {@link SolidityParser#assemblyFunction}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitAssemblyFunction(SolidityParser.AssemblyFunctionContext ctx);
	/**
	 * Visit a parse tree produced by {@link SolidityParser#arrayLiteral}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitArrayLiteral(SolidityParser.ArrayLiteralContext ctx);
	/**
	 * Visit a parse tree produced by {@link SolidityParser#elementaryTypeNameExpression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitElementaryTypeNameExpression(SolidityParser.ElementaryTypeNameExpressionContext ctx);
	/**
	 * Visit a parse tree produced by {@link SolidityParser#numberLiteral}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitNumberLiteral(SolidityParser.NumberLiteralContext ctx);
	/**
	 * Visit a parse tree produced by {@link SolidityParser#booleanLit}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitBooleanLit(SolidityParser.BooleanLitContext ctx);
	/**
	 * Visit a parse tree produced by {@link SolidityParser#hexLiteral}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitHexLiteral(SolidityParser.HexLiteralContext ctx);
	/**
	 * Visit a parse tree produced by {@link SolidityParser#argument}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitArgument(SolidityParser.ArgumentContext ctx);
	/**
	 * Visit a parse tree produced by {@link SolidityParser#stringLiteral}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitStringLiteral(SolidityParser.StringLiteralContext ctx);
}