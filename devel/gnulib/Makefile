PORTNAME=	gnulib
PORTVERSION=	20140202
PORTREVISION=	1
CATEGORIES=	devel
MASTER_SITES=	http://erislabs.net/ianb/projects/gnulib/
DISTNAME=	${PORTNAME}-${PORTVERSION}-stable

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNU portability library
WWW=		https://www.gnu.org/software/gnulib/

LICENSE=	lgpl gpl2 lgpl2.1 gpl3 lgpl3
LICENSE_COMB=	multi

BUILD_DEPENDS=	${LOCALBASE}/bin/makeinfo:print/texinfo

USES=		cpe gmake perl5 shebangfix
SHEBANG_FILES=	check-module lib/uniname/gen-uninames.lisp
CPE_VENDOR=	gnu

NO_ARCH=	yes

BUILD_WRKSRC=	${WRKSRC}/doc
ALL_TARGET=	info html
PLIST_FILES=	bin/check-module bin/gnulib-tool
INFO=		${PORTNAME}
PORTDOCS=	gnulib.html
PORTDATA=	*

OPTIONS_DEFINE=	DOCS

post-patch:
	@${REINPLACE_CMD} -e 's,date -u.*,stat -f %Sa -t "@set UPDATED %F %T" `${LS} -t $$^ | ${SED} 1q` > $$@,' \
		-e 's: makeinfo$$: ${LOCALBASE}/bin/makeinfo:' \
		${WRKSRC}/doc/Makefile

do-install:
	${MKDIR} ${STAGEDIR}${DATADIR} ${STAGEDIR}${PREFIX}/${INFO_PATH}
.for p in check-module gnulib-tool
	${INSTALL_SCRIPT} ${WRKSRC}/${p} ${STAGEDIR}${DATADIR}/
	${LN} -s ../${DATADIR_REL}/${p} ${STAGEDIR}${PREFIX}/bin/
.endfor
	${TAR} -cf - -C ${WRKSRC} build-aux config doc lib m4 modules \
		tests top | ${TAR} -xof - -C ${STAGEDIR}${DATADIR}
	${INSTALL_DATA} ${WRKSRC}/doc/gnulib.info ${STAGEDIR}${PREFIX}/${INFO_PATH}

do-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/doc/gnulib.html ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
