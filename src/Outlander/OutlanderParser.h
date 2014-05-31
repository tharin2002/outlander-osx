#import <PEGKit/PKParser.h>

enum {
    OUTLANDERPARSER_TOKEN_KIND_POUND = 14,
    OUTLANDERPARSER_TOKEN_KIND_ABORT,
    OUTLANDERPARSER_TOKEN_KIND_HIGHLIGHT,
    OUTLANDERPARSER_TOKEN_KIND_COLON,
    OUTLANDERPARSER_TOKEN_KIND_SETVARIABLE,
    OUTLANDERPARSER_TOKEN_KIND_VAR,
    OUTLANDERPARSER_TOKEN_KIND_ECHO,
    OUTLANDERPARSER_TOKEN_KIND_SCRIPT,
    OUTLANDERPARSER_TOKEN_KIND_GOTO,
    OUTLANDERPARSER_TOKEN_KIND_EQUALS,
    OUTLANDERPARSER_TOKEN_KIND_ALIAS,
    OUTLANDERPARSER_TOKEN_KIND_NEXTROOM,
    OUTLANDERPARSER_TOKEN_KIND_RESUME,
    OUTLANDERPARSER_TOKEN_KIND_MOVE,
    OUTLANDERPARSER_TOKEN_KIND_PAUSE,
    OUTLANDERPARSER_TOKEN_KIND_PUT,
};

@interface OutlanderParser : PKParser

@end

