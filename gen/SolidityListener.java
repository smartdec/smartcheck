// Generated from C:/solidity-checker/src/main/antlr4/ru.smartdec.soliditycheck\Solidity.g4 by ANTLR 4.7
import org.antlr.v4.runtime.tree.ParseTreeListener;

/**
 * This interface defines a complete listener for a parse tree produced by
 * {@link SolidityParser}.
 */
public interface SolidityListener extends ParseTreeListener {
	/**
	 * Enter a parse tree produced by {@link SolidityParser#sourceUnit}.
	 * @param ctx the parse tree
	 */
	void enterSourceUnit(SolidityParser.SourceUnitContext ctx);
	/**
	 * Exit a parse tree produced by {@link SolidityParser#sourceUnit}.
	 * @param ctx the parse tree
	 */
	void exitSourceUnit(SolidityParser.SourceUnitContext ctx);
	/**
	 * Enter a parse tree produced by {@link SolidityParser#pragmaDirective}.
	 * @param ctx the parse tree
	 */
	void enterPragmaDirective(SolidityParser.PragmaDirectiveContext ctx);
	/**
	 * Exit a parse tree produced by {@link SolidityParser#pragmaDirective}.
	 * @param ctx the parse tree
	 */
	void exitPragmaDirective(SolidityParser.PragmaDirectiveContext ctx);
	/**
	 * Enter a parse tree produced by {@link SolidityParser#pragmaName}.
	 * @param ctx the parse tree
	 */
	void enterPragmaName(SolidityParser.PragmaNameContext ctx);
	/**
	 * Exit a parse tree produced by {@link SolidityParser#pragmaName}.
	 * @param ctx the parse tree
	 */
	void exitPragmaName(SolidityParser.PragmaNameContext ctx);
	/**
	 * Enter a parse tree produced by {@link SolidityParser#pragmaValue}.
	 * @param ctx the parse tree
	 */
	void enterPragmaValue(SolidityParser.PragmaValueContext ctx);
	/**
	 * Exit a parse tree produced by {@link SolidityParser#pragmaValue}.
	 * @param ctx the parse tree
	 */
	void exitPragmaValue(SolidityParser.PragmaValueContext ctx);
	/**
	 * Enter a parse tree produced by {@link SolidityParser#version}.
	 * @param ctx the parse tree
	 */
	void enterVersion(SolidityParser.VersionContext ctx);
	/**
	 * Exit a parse tree produced by {@link SolidityParser#version}.
	 * @param ctx the parse tree
	 */
	void exitVersion(SolidityParser.VersionContext ctx);
	/**
	 * Enter a parse tree produced by {@link SolidityParser#versionOperator}.
	 * @param ctx the parse tree
	 */
	void enterVersionOperator(SolidityParser.VersionOperatorContext ctx);
	/**
	 * Exit a parse tree produced by {@link SolidityParser#versionOperator}.
	 * @param ctx the parse tree
	 */
	void exitVersionOperator(SolidityParser.VersionOperatorContext ctx);
	/**
	 * Enter a parse tree produced by {@link SolidityParser#versionConstraint}.
	 * @param ctx the parse tree
	 */
	void enterVersionConstraint(SolidityParser.VersionConstraintContext ctx);
	/**
	 * Exit a parse tree produced by {@link SolidityParser#versionConstraint}.
	 * @param ctx the parse tree
	 */
	void exitVersionConstraint(SolidityParser.VersionConstraintContext ctx);
	/**
	 * Enter a parse tree produced by {@link SolidityParser#importDeclaration}.
	 * @param ctx the parse tree
	 */
	void enterImportDeclaration(SolidityParser.ImportDeclarationContext ctx);
	/**
	 * Exit a parse tree produced by {@link SolidityParser#importDeclaration}.
	 * @param ctx the parse tree
	 */
	void exitImportDeclaration(SolidityParser.ImportDeclarationContext ctx);
	/**
	 * Enter a parse tree produced by {@link SolidityParser#importDirective}.
	 * @param ctx the parse tree
	 */
	void enterImportDirective(SolidityParser.ImportDirectiveContext ctx);
	/**
	 * Exit a parse tree produced by {@link SolidityParser#importDirective}.
	 * @param ctx the parse tree
	 */
	void exitImportDirective(SolidityParser.ImportDirectiveContext ctx);
	/**
	 * Enter a parse tree produced by {@link SolidityParser#contractDefinition}.
	 * @param ctx the parse tree
	 */
	void enterContractDefinition(SolidityParser.ContractDefinitionContext ctx);
	/**
	 * Exit a parse tree produced by {@link SolidityParser#contractDefinition}.
	 * @param ctx the parse tree
	 */
	void exitContractDefinition(SolidityParser.ContractDefinitionContext ctx);
	/**
	 * Enter a parse tree produced by {@link SolidityParser#inheritanceSpecifier}.
	 * @param ctx the parse tree
	 */
	void enterInheritanceSpecifier(SolidityParser.InheritanceSpecifierContext ctx);
	/**
	 * Exit a parse tree produced by {@link SolidityParser#inheritanceSpecifier}.
	 * @param ctx the parse tree
	 */
	void exitInheritanceSpecifier(SolidityParser.InheritanceSpecifierContext ctx);
	/**
	 * Enter a parse tree produced by {@link SolidityParser#contractPart}.
	 * @param ctx the parse tree
	 */
	void enterContractPart(SolidityParser.ContractPartContext ctx);
	/**
	 * Exit a parse tree produced by {@link SolidityParser#contractPart}.
	 * @param ctx the parse tree
	 */
	void exitContractPart(SolidityParser.ContractPartContext ctx);
	/**
	 * Enter a parse tree produced by {@link SolidityParser#contractPartDefinition}.
	 * @param ctx the parse tree
	 */
	void enterContractPartDefinition(SolidityParser.ContractPartDefinitionContext ctx);
	/**
	 * Exit a parse tree produced by {@link SolidityParser#contractPartDefinition}.
	 * @param ctx the parse tree
	 */
	void exitContractPartDefinition(SolidityParser.ContractPartDefinitionContext ctx);
	/**
	 * Enter a parse tree produced by {@link SolidityParser#stateVariableDeclaration}.
	 * @param ctx the parse tree
	 */
	void enterStateVariableDeclaration(SolidityParser.StateVariableDeclarationContext ctx);
	/**
	 * Exit a parse tree produced by {@link SolidityParser#stateVariableDeclaration}.
	 * @param ctx the parse tree
	 */
	void exitStateVariableDeclaration(SolidityParser.StateVariableDeclarationContext ctx);
	/**
	 * Enter a parse tree produced by {@link SolidityParser#visibleType}.
	 * @param ctx the parse tree
	 */
	void enterVisibleType(SolidityParser.VisibleTypeContext ctx);
	/**
	 * Exit a parse tree produced by {@link SolidityParser#visibleType}.
	 * @param ctx the parse tree
	 */
	void exitVisibleType(SolidityParser.VisibleTypeContext ctx);
	/**
	 * Enter a parse tree produced by {@link SolidityParser#usingForDeclaration}.
	 * @param ctx the parse tree
	 */
	void enterUsingForDeclaration(SolidityParser.UsingForDeclarationContext ctx);
	/**
	 * Exit a parse tree produced by {@link SolidityParser#usingForDeclaration}.
	 * @param ctx the parse tree
	 */
	void exitUsingForDeclaration(SolidityParser.UsingForDeclarationContext ctx);
	/**
	 * Enter a parse tree produced by {@link SolidityParser#structDefinition}.
	 * @param ctx the parse tree
	 */
	void enterStructDefinition(SolidityParser.StructDefinitionContext ctx);
	/**
	 * Exit a parse tree produced by {@link SolidityParser#structDefinition}.
	 * @param ctx the parse tree
	 */
	void exitStructDefinition(SolidityParser.StructDefinitionContext ctx);
	/**
	 * Enter a parse tree produced by {@link SolidityParser#modifierDefinition}.
	 * @param ctx the parse tree
	 */
	void enterModifierDefinition(SolidityParser.ModifierDefinitionContext ctx);
	/**
	 * Exit a parse tree produced by {@link SolidityParser#modifierDefinition}.
	 * @param ctx the parse tree
	 */
	void exitModifierDefinition(SolidityParser.ModifierDefinitionContext ctx);
	/**
	 * Enter a parse tree produced by {@link SolidityParser#functionDefinition}.
	 * @param ctx the parse tree
	 */
	void enterFunctionDefinition(SolidityParser.FunctionDefinitionContext ctx);
	/**
	 * Exit a parse tree produced by {@link SolidityParser#functionDefinition}.
	 * @param ctx the parse tree
	 */
	void exitFunctionDefinition(SolidityParser.FunctionDefinitionContext ctx);
	/**
	 * Enter a parse tree produced by {@link SolidityParser#functionFallBackDefinition}.
	 * @param ctx the parse tree
	 */
	void enterFunctionFallBackDefinition(SolidityParser.FunctionFallBackDefinitionContext ctx);
	/**
	 * Exit a parse tree produced by {@link SolidityParser#functionFallBackDefinition}.
	 * @param ctx the parse tree
	 */
	void exitFunctionFallBackDefinition(SolidityParser.FunctionFallBackDefinitionContext ctx);
	/**
	 * Enter a parse tree produced by {@link SolidityParser#functionFallBackCall}.
	 * @param ctx the parse tree
	 */
	void enterFunctionFallBackCall(SolidityParser.FunctionFallBackCallContext ctx);
	/**
	 * Exit a parse tree produced by {@link SolidityParser#functionFallBackCall}.
	 * @param ctx the parse tree
	 */
	void exitFunctionFallBackCall(SolidityParser.FunctionFallBackCallContext ctx);
	/**
	 * Enter a parse tree produced by {@link SolidityParser#eventDefinition}.
	 * @param ctx the parse tree
	 */
	void enterEventDefinition(SolidityParser.EventDefinitionContext ctx);
	/**
	 * Exit a parse tree produced by {@link SolidityParser#eventDefinition}.
	 * @param ctx the parse tree
	 */
	void exitEventDefinition(SolidityParser.EventDefinitionContext ctx);
	/**
	 * Enter a parse tree produced by {@link SolidityParser#enumDefinition}.
	 * @param ctx the parse tree
	 */
	void enterEnumDefinition(SolidityParser.EnumDefinitionContext ctx);
	/**
	 * Exit a parse tree produced by {@link SolidityParser#enumDefinition}.
	 * @param ctx the parse tree
	 */
	void exitEnumDefinition(SolidityParser.EnumDefinitionContext ctx);
	/**
	 * Enter a parse tree produced by {@link SolidityParser#enumValue}.
	 * @param ctx the parse tree
	 */
	void enterEnumValue(SolidityParser.EnumValueContext ctx);
	/**
	 * Exit a parse tree produced by {@link SolidityParser#enumValue}.
	 * @param ctx the parse tree
	 */
	void exitEnumValue(SolidityParser.EnumValueContext ctx);
	/**
	 * Enter a parse tree produced by {@link SolidityParser#indexedParameterList}.
	 * @param ctx the parse tree
	 */
	void enterIndexedParameterList(SolidityParser.IndexedParameterListContext ctx);
	/**
	 * Exit a parse tree produced by {@link SolidityParser#indexedParameterList}.
	 * @param ctx the parse tree
	 */
	void exitIndexedParameterList(SolidityParser.IndexedParameterListContext ctx);
	/**
	 * Enter a parse tree produced by {@link SolidityParser#parameterList}.
	 * @param ctx the parse tree
	 */
	void enterParameterList(SolidityParser.ParameterListContext ctx);
	/**
	 * Exit a parse tree produced by {@link SolidityParser#parameterList}.
	 * @param ctx the parse tree
	 */
	void exitParameterList(SolidityParser.ParameterListContext ctx);
	/**
	 * Enter a parse tree produced by {@link SolidityParser#parameter}.
	 * @param ctx the parse tree
	 */
	void enterParameter(SolidityParser.ParameterContext ctx);
	/**
	 * Exit a parse tree produced by {@link SolidityParser#parameter}.
	 * @param ctx the parse tree
	 */
	void exitParameter(SolidityParser.ParameterContext ctx);
	/**
	 * Enter a parse tree produced by {@link SolidityParser#typeNameList}.
	 * @param ctx the parse tree
	 */
	void enterTypeNameList(SolidityParser.TypeNameListContext ctx);
	/**
	 * Exit a parse tree produced by {@link SolidityParser#typeNameList}.
	 * @param ctx the parse tree
	 */
	void exitTypeNameList(SolidityParser.TypeNameListContext ctx);
	/**
	 * Enter a parse tree produced by {@link SolidityParser#variableDeclaration}.
	 * @param ctx the parse tree
	 */
	void enterVariableDeclaration(SolidityParser.VariableDeclarationContext ctx);
	/**
	 * Exit a parse tree produced by {@link SolidityParser#variableDeclaration}.
	 * @param ctx the parse tree
	 */
	void exitVariableDeclaration(SolidityParser.VariableDeclarationContext ctx);
	/**
	 * Enter a parse tree produced by {@link SolidityParser#variableDeclarationList}.
	 * @param ctx the parse tree
	 */
	void enterVariableDeclarationList(SolidityParser.VariableDeclarationListContext ctx);
	/**
	 * Exit a parse tree produced by {@link SolidityParser#variableDeclarationList}.
	 * @param ctx the parse tree
	 */
	void exitVariableDeclarationList(SolidityParser.VariableDeclarationListContext ctx);
	/**
	 * Enter a parse tree produced by {@link SolidityParser#typeName}.
	 * @param ctx the parse tree
	 */
	void enterTypeName(SolidityParser.TypeNameContext ctx);
	/**
	 * Exit a parse tree produced by {@link SolidityParser#typeName}.
	 * @param ctx the parse tree
	 */
	void exitTypeName(SolidityParser.TypeNameContext ctx);
	/**
	 * Enter a parse tree produced by {@link SolidityParser#userDefinedTypeName}.
	 * @param ctx the parse tree
	 */
	void enterUserDefinedTypeName(SolidityParser.UserDefinedTypeNameContext ctx);
	/**
	 * Exit a parse tree produced by {@link SolidityParser#userDefinedTypeName}.
	 * @param ctx the parse tree
	 */
	void exitUserDefinedTypeName(SolidityParser.UserDefinedTypeNameContext ctx);
	/**
	 * Enter a parse tree produced by {@link SolidityParser#mappingSt}.
	 * @param ctx the parse tree
	 */
	void enterMappingSt(SolidityParser.MappingStContext ctx);
	/**
	 * Exit a parse tree produced by {@link SolidityParser#mappingSt}.
	 * @param ctx the parse tree
	 */
	void exitMappingSt(SolidityParser.MappingStContext ctx);
	/**
	 * Enter a parse tree produced by {@link SolidityParser#functionTypeName}.
	 * @param ctx the parse tree
	 */
	void enterFunctionTypeName(SolidityParser.FunctionTypeNameContext ctx);
	/**
	 * Exit a parse tree produced by {@link SolidityParser#functionTypeName}.
	 * @param ctx the parse tree
	 */
	void exitFunctionTypeName(SolidityParser.FunctionTypeNameContext ctx);
	/**
	 * Enter a parse tree produced by {@link SolidityParser#storageLocation}.
	 * @param ctx the parse tree
	 */
	void enterStorageLocation(SolidityParser.StorageLocationContext ctx);
	/**
	 * Exit a parse tree produced by {@link SolidityParser#storageLocation}.
	 * @param ctx the parse tree
	 */
	void exitStorageLocation(SolidityParser.StorageLocationContext ctx);
	/**
	 * Enter a parse tree produced by {@link SolidityParser#blockCall}.
	 * @param ctx the parse tree
	 */
	void enterBlockCall(SolidityParser.BlockCallContext ctx);
	/**
	 * Exit a parse tree produced by {@link SolidityParser#blockCall}.
	 * @param ctx the parse tree
	 */
	void exitBlockCall(SolidityParser.BlockCallContext ctx);
	/**
	 * Enter a parse tree produced by {@link SolidityParser#block}.
	 * @param ctx the parse tree
	 */
	void enterBlock(SolidityParser.BlockContext ctx);
	/**
	 * Exit a parse tree produced by {@link SolidityParser#block}.
	 * @param ctx the parse tree
	 */
	void exitBlock(SolidityParser.BlockContext ctx);
	/**
	 * Enter a parse tree produced by {@link SolidityParser#statement}.
	 * @param ctx the parse tree
	 */
	void enterStatement(SolidityParser.StatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link SolidityParser#statement}.
	 * @param ctx the parse tree
	 */
	void exitStatement(SolidityParser.StatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link SolidityParser#expressionStatement}.
	 * @param ctx the parse tree
	 */
	void enterExpressionStatement(SolidityParser.ExpressionStatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link SolidityParser#expressionStatement}.
	 * @param ctx the parse tree
	 */
	void exitExpressionStatement(SolidityParser.ExpressionStatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link SolidityParser#ifStatement}.
	 * @param ctx the parse tree
	 */
	void enterIfStatement(SolidityParser.IfStatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link SolidityParser#ifStatement}.
	 * @param ctx the parse tree
	 */
	void exitIfStatement(SolidityParser.IfStatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link SolidityParser#ifCondition}.
	 * @param ctx the parse tree
	 */
	void enterIfCondition(SolidityParser.IfConditionContext ctx);
	/**
	 * Exit a parse tree produced by {@link SolidityParser#ifCondition}.
	 * @param ctx the parse tree
	 */
	void exitIfCondition(SolidityParser.IfConditionContext ctx);
	/**
	 * Enter a parse tree produced by {@link SolidityParser#whileStatement}.
	 * @param ctx the parse tree
	 */
	void enterWhileStatement(SolidityParser.WhileStatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link SolidityParser#whileStatement}.
	 * @param ctx the parse tree
	 */
	void exitWhileStatement(SolidityParser.WhileStatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link SolidityParser#placeholderStatement}.
	 * @param ctx the parse tree
	 */
	void enterPlaceholderStatement(SolidityParser.PlaceholderStatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link SolidityParser#placeholderStatement}.
	 * @param ctx the parse tree
	 */
	void exitPlaceholderStatement(SolidityParser.PlaceholderStatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link SolidityParser#simpleStatement}.
	 * @param ctx the parse tree
	 */
	void enterSimpleStatement(SolidityParser.SimpleStatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link SolidityParser#simpleStatement}.
	 * @param ctx the parse tree
	 */
	void exitSimpleStatement(SolidityParser.SimpleStatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link SolidityParser#forStatement}.
	 * @param ctx the parse tree
	 */
	void enterForStatement(SolidityParser.ForStatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link SolidityParser#forStatement}.
	 * @param ctx the parse tree
	 */
	void exitForStatement(SolidityParser.ForStatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link SolidityParser#inlineAssemblyStatement}.
	 * @param ctx the parse tree
	 */
	void enterInlineAssemblyStatement(SolidityParser.InlineAssemblyStatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link SolidityParser#inlineAssemblyStatement}.
	 * @param ctx the parse tree
	 */
	void exitInlineAssemblyStatement(SolidityParser.InlineAssemblyStatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link SolidityParser#doWhileStatement}.
	 * @param ctx the parse tree
	 */
	void enterDoWhileStatement(SolidityParser.DoWhileStatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link SolidityParser#doWhileStatement}.
	 * @param ctx the parse tree
	 */
	void exitDoWhileStatement(SolidityParser.DoWhileStatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link SolidityParser#continueStatement}.
	 * @param ctx the parse tree
	 */
	void enterContinueStatement(SolidityParser.ContinueStatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link SolidityParser#continueStatement}.
	 * @param ctx the parse tree
	 */
	void exitContinueStatement(SolidityParser.ContinueStatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link SolidityParser#breakStatement}.
	 * @param ctx the parse tree
	 */
	void enterBreakStatement(SolidityParser.BreakStatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link SolidityParser#breakStatement}.
	 * @param ctx the parse tree
	 */
	void exitBreakStatement(SolidityParser.BreakStatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link SolidityParser#returnStatement}.
	 * @param ctx the parse tree
	 */
	void enterReturnStatement(SolidityParser.ReturnStatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link SolidityParser#returnStatement}.
	 * @param ctx the parse tree
	 */
	void exitReturnStatement(SolidityParser.ReturnStatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link SolidityParser#throwStatement}.
	 * @param ctx the parse tree
	 */
	void enterThrowStatement(SolidityParser.ThrowStatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link SolidityParser#throwStatement}.
	 * @param ctx the parse tree
	 */
	void exitThrowStatement(SolidityParser.ThrowStatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link SolidityParser#variableDeclarationStatement}.
	 * @param ctx the parse tree
	 */
	void enterVariableDeclarationStatement(SolidityParser.VariableDeclarationStatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link SolidityParser#variableDeclarationStatement}.
	 * @param ctx the parse tree
	 */
	void exitVariableDeclarationStatement(SolidityParser.VariableDeclarationStatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link SolidityParser#identifierList}.
	 * @param ctx the parse tree
	 */
	void enterIdentifierList(SolidityParser.IdentifierListContext ctx);
	/**
	 * Exit a parse tree produced by {@link SolidityParser#identifierList}.
	 * @param ctx the parse tree
	 */
	void exitIdentifierList(SolidityParser.IdentifierListContext ctx);
	/**
	 * Enter a parse tree produced by {@link SolidityParser#identifier}.
	 * @param ctx the parse tree
	 */
	void enterIdentifier(SolidityParser.IdentifierContext ctx);
	/**
	 * Exit a parse tree produced by {@link SolidityParser#identifier}.
	 * @param ctx the parse tree
	 */
	void exitIdentifier(SolidityParser.IdentifierContext ctx);
	/**
	 * Enter a parse tree produced by {@link SolidityParser#elementaryTypeName}.
	 * @param ctx the parse tree
	 */
	void enterElementaryTypeName(SolidityParser.ElementaryTypeNameContext ctx);
	/**
	 * Exit a parse tree produced by {@link SolidityParser#elementaryTypeName}.
	 * @param ctx the parse tree
	 */
	void exitElementaryTypeName(SolidityParser.ElementaryTypeNameContext ctx);
	/**
	 * Enter a parse tree produced by {@link SolidityParser#creatingContractViaNewStatement}.
	 * @param ctx the parse tree
	 */
	void enterCreatingContractViaNewStatement(SolidityParser.CreatingContractViaNewStatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link SolidityParser#creatingContractViaNewStatement}.
	 * @param ctx the parse tree
	 */
	void exitCreatingContractViaNewStatement(SolidityParser.CreatingContractViaNewStatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link SolidityParser#expression}.
	 * @param ctx the parse tree
	 */
	void enterExpression(SolidityParser.ExpressionContext ctx);
	/**
	 * Exit a parse tree produced by {@link SolidityParser#expression}.
	 * @param ctx the parse tree
	 */
	void exitExpression(SolidityParser.ExpressionContext ctx);
	/**
	 * Enter a parse tree produced by {@link SolidityParser#binaryOperator}.
	 * @param ctx the parse tree
	 */
	void enterBinaryOperator(SolidityParser.BinaryOperatorContext ctx);
	/**
	 * Exit a parse tree produced by {@link SolidityParser#binaryOperator}.
	 * @param ctx the parse tree
	 */
	void exitBinaryOperator(SolidityParser.BinaryOperatorContext ctx);
	/**
	 * Enter a parse tree produced by {@link SolidityParser#comparison}.
	 * @param ctx the parse tree
	 */
	void enterComparison(SolidityParser.ComparisonContext ctx);
	/**
	 * Exit a parse tree produced by {@link SolidityParser#comparison}.
	 * @param ctx the parse tree
	 */
	void exitComparison(SolidityParser.ComparisonContext ctx);
	/**
	 * Enter a parse tree produced by {@link SolidityParser#primaryExpression}.
	 * @param ctx the parse tree
	 */
	void enterPrimaryExpression(SolidityParser.PrimaryExpressionContext ctx);
	/**
	 * Exit a parse tree produced by {@link SolidityParser#primaryExpression}.
	 * @param ctx the parse tree
	 */
	void exitPrimaryExpression(SolidityParser.PrimaryExpressionContext ctx);
	/**
	 * Enter a parse tree produced by {@link SolidityParser#tupleExpression}.
	 * @param ctx the parse tree
	 */
	void enterTupleExpression(SolidityParser.TupleExpressionContext ctx);
	/**
	 * Exit a parse tree produced by {@link SolidityParser#tupleExpression}.
	 * @param ctx the parse tree
	 */
	void exitTupleExpression(SolidityParser.TupleExpressionContext ctx);
	/**
	 * Enter a parse tree produced by {@link SolidityParser#expressionList}.
	 * @param ctx the parse tree
	 */
	void enterExpressionList(SolidityParser.ExpressionListContext ctx);
	/**
	 * Exit a parse tree produced by {@link SolidityParser#expressionList}.
	 * @param ctx the parse tree
	 */
	void exitExpressionList(SolidityParser.ExpressionListContext ctx);
	/**
	 * Enter a parse tree produced by {@link SolidityParser#nameValueList}.
	 * @param ctx the parse tree
	 */
	void enterNameValueList(SolidityParser.NameValueListContext ctx);
	/**
	 * Exit a parse tree produced by {@link SolidityParser#nameValueList}.
	 * @param ctx the parse tree
	 */
	void exitNameValueList(SolidityParser.NameValueListContext ctx);
	/**
	 * Enter a parse tree produced by {@link SolidityParser#functionCall}.
	 * @param ctx the parse tree
	 */
	void enterFunctionCall(SolidityParser.FunctionCallContext ctx);
	/**
	 * Exit a parse tree produced by {@link SolidityParser#functionCall}.
	 * @param ctx the parse tree
	 */
	void exitFunctionCall(SolidityParser.FunctionCallContext ctx);
	/**
	 * Enter a parse tree produced by {@link SolidityParser#internalFunctionCall}.
	 * @param ctx the parse tree
	 */
	void enterInternalFunctionCall(SolidityParser.InternalFunctionCallContext ctx);
	/**
	 * Exit a parse tree produced by {@link SolidityParser#internalFunctionCall}.
	 * @param ctx the parse tree
	 */
	void exitInternalFunctionCall(SolidityParser.InternalFunctionCallContext ctx);
	/**
	 * Enter a parse tree produced by {@link SolidityParser#externalFunctionCall}.
	 * @param ctx the parse tree
	 */
	void enterExternalFunctionCall(SolidityParser.ExternalFunctionCallContext ctx);
	/**
	 * Exit a parse tree produced by {@link SolidityParser#externalFunctionCall}.
	 * @param ctx the parse tree
	 */
	void exitExternalFunctionCall(SolidityParser.ExternalFunctionCallContext ctx);
	/**
	 * Enter a parse tree produced by {@link SolidityParser#externalFunctionCallThis}.
	 * @param ctx the parse tree
	 */
	void enterExternalFunctionCallThis(SolidityParser.ExternalFunctionCallThisContext ctx);
	/**
	 * Exit a parse tree produced by {@link SolidityParser#externalFunctionCallThis}.
	 * @param ctx the parse tree
	 */
	void exitExternalFunctionCallThis(SolidityParser.ExternalFunctionCallThisContext ctx);
	/**
	 * Enter a parse tree produced by {@link SolidityParser#externalFunctionCallNotThis}.
	 * @param ctx the parse tree
	 */
	void enterExternalFunctionCallNotThis(SolidityParser.ExternalFunctionCallNotThisContext ctx);
	/**
	 * Exit a parse tree produced by {@link SolidityParser#externalFunctionCallNotThis}.
	 * @param ctx the parse tree
	 */
	void exitExternalFunctionCallNotThis(SolidityParser.ExternalFunctionCallNotThisContext ctx);
	/**
	 * Enter a parse tree produced by {@link SolidityParser#callObject}.
	 * @param ctx the parse tree
	 */
	void enterCallObject(SolidityParser.CallObjectContext ctx);
	/**
	 * Exit a parse tree produced by {@link SolidityParser#callObject}.
	 * @param ctx the parse tree
	 */
	void exitCallObject(SolidityParser.CallObjectContext ctx);
	/**
	 * Enter a parse tree produced by {@link SolidityParser#functionCallStatement}.
	 * @param ctx the parse tree
	 */
	void enterFunctionCallStatement(SolidityParser.FunctionCallStatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link SolidityParser#functionCallStatement}.
	 * @param ctx the parse tree
	 */
	void exitFunctionCallStatement(SolidityParser.FunctionCallStatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link SolidityParser#functionCallArguments}.
	 * @param ctx the parse tree
	 */
	void enterFunctionCallArguments(SolidityParser.FunctionCallArgumentsContext ctx);
	/**
	 * Exit a parse tree produced by {@link SolidityParser#functionCallArguments}.
	 * @param ctx the parse tree
	 */
	void exitFunctionCallArguments(SolidityParser.FunctionCallArgumentsContext ctx);
	/**
	 * Enter a parse tree produced by {@link SolidityParser#functionName}.
	 * @param ctx the parse tree
	 */
	void enterFunctionName(SolidityParser.FunctionNameContext ctx);
	/**
	 * Exit a parse tree produced by {@link SolidityParser#functionName}.
	 * @param ctx the parse tree
	 */
	void exitFunctionName(SolidityParser.FunctionNameContext ctx);
	/**
	 * Enter a parse tree produced by {@link SolidityParser#functionCallArgument}.
	 * @param ctx the parse tree
	 */
	void enterFunctionCallArgument(SolidityParser.FunctionCallArgumentContext ctx);
	/**
	 * Exit a parse tree produced by {@link SolidityParser#functionCallArgument}.
	 * @param ctx the parse tree
	 */
	void exitFunctionCallArgument(SolidityParser.FunctionCallArgumentContext ctx);
	/**
	 * Enter a parse tree produced by {@link SolidityParser#newExpression}.
	 * @param ctx the parse tree
	 */
	void enterNewExpression(SolidityParser.NewExpressionContext ctx);
	/**
	 * Exit a parse tree produced by {@link SolidityParser#newExpression}.
	 * @param ctx the parse tree
	 */
	void exitNewExpression(SolidityParser.NewExpressionContext ctx);
	/**
	 * Enter a parse tree produced by {@link SolidityParser#inlineAssemblyBlock}.
	 * @param ctx the parse tree
	 */
	void enterInlineAssemblyBlock(SolidityParser.InlineAssemblyBlockContext ctx);
	/**
	 * Exit a parse tree produced by {@link SolidityParser#inlineAssemblyBlock}.
	 * @param ctx the parse tree
	 */
	void exitInlineAssemblyBlock(SolidityParser.InlineAssemblyBlockContext ctx);
	/**
	 * Enter a parse tree produced by {@link SolidityParser#assemblyItem}.
	 * @param ctx the parse tree
	 */
	void enterAssemblyItem(SolidityParser.AssemblyItemContext ctx);
	/**
	 * Exit a parse tree produced by {@link SolidityParser#assemblyItem}.
	 * @param ctx the parse tree
	 */
	void exitAssemblyItem(SolidityParser.AssemblyItemContext ctx);
	/**
	 * Enter a parse tree produced by {@link SolidityParser#assemblyItemCase}.
	 * @param ctx the parse tree
	 */
	void enterAssemblyItemCase(SolidityParser.AssemblyItemCaseContext ctx);
	/**
	 * Exit a parse tree produced by {@link SolidityParser#assemblyItemCase}.
	 * @param ctx the parse tree
	 */
	void exitAssemblyItemCase(SolidityParser.AssemblyItemCaseContext ctx);
	/**
	 * Enter a parse tree produced by {@link SolidityParser#assemblyItemDefault}.
	 * @param ctx the parse tree
	 */
	void enterAssemblyItemDefault(SolidityParser.AssemblyItemDefaultContext ctx);
	/**
	 * Exit a parse tree produced by {@link SolidityParser#assemblyItemDefault}.
	 * @param ctx the parse tree
	 */
	void exitAssemblyItemDefault(SolidityParser.AssemblyItemDefaultContext ctx);
	/**
	 * Enter a parse tree produced by {@link SolidityParser#assemblyItemSwitch}.
	 * @param ctx the parse tree
	 */
	void enterAssemblyItemSwitch(SolidityParser.AssemblyItemSwitchContext ctx);
	/**
	 * Exit a parse tree produced by {@link SolidityParser#assemblyItemSwitch}.
	 * @param ctx the parse tree
	 */
	void exitAssemblyItemSwitch(SolidityParser.AssemblyItemSwitchContext ctx);
	/**
	 * Enter a parse tree produced by {@link SolidityParser#assemblyLocalBinding}.
	 * @param ctx the parse tree
	 */
	void enterAssemblyLocalBinding(SolidityParser.AssemblyLocalBindingContext ctx);
	/**
	 * Exit a parse tree produced by {@link SolidityParser#assemblyLocalBinding}.
	 * @param ctx the parse tree
	 */
	void exitAssemblyLocalBinding(SolidityParser.AssemblyLocalBindingContext ctx);
	/**
	 * Enter a parse tree produced by {@link SolidityParser#assemblyAssignment}.
	 * @param ctx the parse tree
	 */
	void enterAssemblyAssignment(SolidityParser.AssemblyAssignmentContext ctx);
	/**
	 * Exit a parse tree produced by {@link SolidityParser#assemblyAssignment}.
	 * @param ctx the parse tree
	 */
	void exitAssemblyAssignment(SolidityParser.AssemblyAssignmentContext ctx);
	/**
	 * Enter a parse tree produced by {@link SolidityParser#assemblerFor}.
	 * @param ctx the parse tree
	 */
	void enterAssemblerFor(SolidityParser.AssemblerForContext ctx);
	/**
	 * Exit a parse tree produced by {@link SolidityParser#assemblerFor}.
	 * @param ctx the parse tree
	 */
	void exitAssemblerFor(SolidityParser.AssemblerForContext ctx);
	/**
	 * Enter a parse tree produced by {@link SolidityParser#functionalAssemblyExpression}.
	 * @param ctx the parse tree
	 */
	void enterFunctionalAssemblyExpression(SolidityParser.FunctionalAssemblyExpressionContext ctx);
	/**
	 * Exit a parse tree produced by {@link SolidityParser#functionalAssemblyExpression}.
	 * @param ctx the parse tree
	 */
	void exitFunctionalAssemblyExpression(SolidityParser.FunctionalAssemblyExpressionContext ctx);
	/**
	 * Enter a parse tree produced by {@link SolidityParser#assemblyFunction}.
	 * @param ctx the parse tree
	 */
	void enterAssemblyFunction(SolidityParser.AssemblyFunctionContext ctx);
	/**
	 * Exit a parse tree produced by {@link SolidityParser#assemblyFunction}.
	 * @param ctx the parse tree
	 */
	void exitAssemblyFunction(SolidityParser.AssemblyFunctionContext ctx);
	/**
	 * Enter a parse tree produced by {@link SolidityParser#arrayLiteral}.
	 * @param ctx the parse tree
	 */
	void enterArrayLiteral(SolidityParser.ArrayLiteralContext ctx);
	/**
	 * Exit a parse tree produced by {@link SolidityParser#arrayLiteral}.
	 * @param ctx the parse tree
	 */
	void exitArrayLiteral(SolidityParser.ArrayLiteralContext ctx);
	/**
	 * Enter a parse tree produced by {@link SolidityParser#elementaryTypeNameExpression}.
	 * @param ctx the parse tree
	 */
	void enterElementaryTypeNameExpression(SolidityParser.ElementaryTypeNameExpressionContext ctx);
	/**
	 * Exit a parse tree produced by {@link SolidityParser#elementaryTypeNameExpression}.
	 * @param ctx the parse tree
	 */
	void exitElementaryTypeNameExpression(SolidityParser.ElementaryTypeNameExpressionContext ctx);
	/**
	 * Enter a parse tree produced by {@link SolidityParser#numberLiteral}.
	 * @param ctx the parse tree
	 */
	void enterNumberLiteral(SolidityParser.NumberLiteralContext ctx);
	/**
	 * Exit a parse tree produced by {@link SolidityParser#numberLiteral}.
	 * @param ctx the parse tree
	 */
	void exitNumberLiteral(SolidityParser.NumberLiteralContext ctx);
	/**
	 * Enter a parse tree produced by {@link SolidityParser#booleanLit}.
	 * @param ctx the parse tree
	 */
	void enterBooleanLit(SolidityParser.BooleanLitContext ctx);
	/**
	 * Exit a parse tree produced by {@link SolidityParser#booleanLit}.
	 * @param ctx the parse tree
	 */
	void exitBooleanLit(SolidityParser.BooleanLitContext ctx);
	/**
	 * Enter a parse tree produced by {@link SolidityParser#hexLiteral}.
	 * @param ctx the parse tree
	 */
	void enterHexLiteral(SolidityParser.HexLiteralContext ctx);
	/**
	 * Exit a parse tree produced by {@link SolidityParser#hexLiteral}.
	 * @param ctx the parse tree
	 */
	void exitHexLiteral(SolidityParser.HexLiteralContext ctx);
	/**
	 * Enter a parse tree produced by {@link SolidityParser#argument}.
	 * @param ctx the parse tree
	 */
	void enterArgument(SolidityParser.ArgumentContext ctx);
	/**
	 * Exit a parse tree produced by {@link SolidityParser#argument}.
	 * @param ctx the parse tree
	 */
	void exitArgument(SolidityParser.ArgumentContext ctx);
	/**
	 * Enter a parse tree produced by {@link SolidityParser#stringLiteral}.
	 * @param ctx the parse tree
	 */
	void enterStringLiteral(SolidityParser.StringLiteralContext ctx);
	/**
	 * Exit a parse tree produced by {@link SolidityParser#stringLiteral}.
	 * @param ctx the parse tree
	 */
	void exitStringLiteral(SolidityParser.StringLiteralContext ctx);
}