# $MidnightBSD$

PORTNAME=	codeeditor
PORTVERSION=	0.4.4
PORTREVISION=	2
CATEGORIES=	editors gnustep
MASTER_SITES=	${MASTER_SITE_SAVANNAH}
MASTER_SITE_SUBDIR=	codeeditor
DISTNAME=	CodeEditor-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	CodeEditor is a text and code editor for GNUstep

LICENSE=	gpl2

USES=		gnustep
USE_GNUSTEP=	back build

WRKSRC=		${WRKDIR}/CodeEditor
MAKE_ENV+=	GNUSTEP_INSTALLATION_DIR=${GNUSTEP_LOCAL_ROOT}

post-patch:
	${REINPLACE_CMD} -e 's| bool| mybool|' -e 's|(bool|(mybool|' \
		${WRKSRC}/CodeEditorView/CodeEditorViewPreference.h \
		${WRKSRC}/CodeEditorView/CodeEditorViewPreference.m \
		${WRKSRC}/CodeEditorView/BlockHandler.h \
		${WRKSRC}/CodeEditorView/CodeEditorView.h \
		${WRKSRC}/CodeEditorView/CodeEditorView.m \
		${WRKSRC}/CodeEditor/DocumentController.m \
		${WRKSRC}/LanguageHandler/ObjCHandler/ObjCBlockHandler.m

.include <bsd.port.mk>
