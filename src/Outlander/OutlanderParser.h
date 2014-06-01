#import <PEGKit/PKParser.h>

enum {
    OUTLANDERPARSER_TOKEN_KIND_VAR = 14,
    OUTLANDERPARSER_TOKEN_KIND_MOVE,
    OUTLANDERPARSER_TOKEN_KIND_COLON,
    OUTLANDERPARSER_TOKEN_KIND_ABORT,
    OUTLANDERPARSER_TOKEN_KIND_SEMI_COLON,
    OUTLANDERPARSER_TOKEN_KIND_DOT,
    OUTLANDERPARSER_TOKEN_KIND_ECHO,
    OUTLANDERPARSER_TOKEN_KIND_PAUSE,
    OUTLANDERPARSER_TOKEN_KIND_EQUALS,
    OUTLANDERPARSER_TOKEN_KIND_WAITSTMT,
    OUTLANDERPARSER_TOKEN_KIND_WAITFORRE,
    OUTLANDERPARSER_TOKEN_KIND_POUND,
    OUTLANDERPARSER_TOKEN_KIND_MATCHWAIT,
    OUTLANDERPARSER_TOKEN_KIND_ALIAS,
    OUTLANDERPARSER_TOKEN_KIND_DOLLAR,
    OUTLANDERPARSER_TOKEN_KIND_NEXTROOM,
    OUTLANDERPARSER_TOKEN_KIND_WAITFOR,
    OUTLANDERPARSER_TOKEN_KIND_PERCENT,
    OUTLANDERPARSER_TOKEN_KIND_RESUME,
    OUTLANDERPARSER_TOKEN_KIND_PUT,
    OUTLANDERPARSER_TOKEN_KIND_SCRIPT,
    OUTLANDERPARSER_TOKEN_KIND_SETVARIABLE,
    OUTLANDERPARSER_TOKEN_KIND_MATCHRE,
    OUTLANDERPARSER_TOKEN_KIND_GOTO,
    OUTLANDERPARSER_TOKEN_KIND_PIPE,
    OUTLANDERPARSER_TOKEN_KIND_HIGHLIGHT,
    OUTLANDERPARSER_TOKEN_KIND_MATCH,
};

@interface OutlanderParser : PKParser

@end

