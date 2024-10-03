// Generated from ch/hslu/cobau/minij/MiniJ.g4 by ANTLR 4.8

package ch.hslu.cobau.minij;

import org.antlr.v4.runtime.tree.ParseTreeListener;

/**
 * This interface defines a complete listener for a parse tree produced by
 * {@link MiniJParser}.
 */
public interface MiniJListener extends ParseTreeListener {
	/**
	 * Enter a parse tree produced by {@link MiniJParser#unit}.
	 * @param ctx the parse tree
	 */
	void enterUnit(MiniJParser.UnitContext ctx);
	/**
	 * Exit a parse tree produced by {@link MiniJParser#unit}.
	 * @param ctx the parse tree
	 */
	void exitUnit(MiniJParser.UnitContext ctx);
}