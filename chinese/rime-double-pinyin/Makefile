PORTNAME=	rime-double-pinyin
DISTVERSION=	g20190120
PORTREVISION=	1
CATEGORIES=	chinese textproc

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Rime Double Pinyin schema support
WWW=		https://github.com/rime/rime-double-pinyin

LICENSE=	gpl3
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	rime_deployer:chinese/librime	\
		zh-rime-essay>g0:chinese/rime-essay \
		zh-rime-prelude>g0:chinese/rime-prelude \
		zh-rime-luna-pinyin>g0:chinese/rime-luna-pinyin
RUN_DEPENDS=	zh-rime-prelude>g0:chinese/rime-prelude \
		zh-rime-luna-pinyin>g0:chinese/rime-luna-pinyin

USES=		localbase

OPTIONS_DEFINE=	DOCS
OPTIONS_SUB=	yes

USE_GITHUB=	yes
GH_ACCOUNT=	rime
GH_TAGNAME=	69bf85d4dfe8bac139c36abbd68d530b8b6622ea

NO_ARCH=	yes

PORTDOCS=	AUTHORS README.md

PRELUDE_FILES=	default.yaml key_bindings.yaml punctuation.yaml symbols.yaml
ESSAY_FILES=	essay.txt
LUNA_PINYIN_FILES=	luna_pinyin.dict.yaml
SCHEMA_FILES=	double_pinyin.schema.yaml \
		double_pinyin_abc.schema.yaml \
		double_pinyin_flypy.schema.yaml \
		double_pinyin_mspy.schema.yaml \
		double_pinyin_pyjj.schema.yaml
MY_OUTDIR=	${WRKDIR}/out

do-build:
	@${MKDIR} ${MY_OUTDIR}
	@${RLN} ${WRKSRC}/* ${MY_OUTDIR}
.for i in ${PRELUDE_FILES} ${ESSAY_FILES} ${LUNA_PINYIN_FILES}
	@${CP} ${LOCALBASE}/share/rime-data/${i} ${MY_OUTDIR}
.endfor
.for i in ${SCHEMA_FILES}
	rime_deployer --compile ${WRKSRC}/${i} ${MY_OUTDIR}
.endfor

do-install:
	@${MKDIR} ${STAGEDIR}${PREFIX}/share/rime-data
	@${MKDIR} ${STAGEDIR}${PREFIX}/share/rime-data/build
	${INSTALL_DATA} ${WRKSRC}/*.yaml ${STAGEDIR}${PREFIX}/share/rime-data
	${INSTALL_DATA} ${MY_OUTDIR}/build/double_pinyin* \
		${STAGEDIR}${PREFIX}/share/rime-data/build

do-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_MAN} ${WRKSRC}/AUTHORS ${FAKE_DESTDIR}/${DOCSDIR}
	${INSTALL_MAN} ${WRKSRC}/README.md ${FAKE_DESTDIR}/${DOCSDIR}

.include <bsd.port.mk>
