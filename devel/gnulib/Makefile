# $MidnightBSD$
# $FreeBSD: head/devel/gnulib/Makefile 359172 2014-06-24 22:52:47Z bapt $

PORTNAME=	gnulib
PORTVERSION=	20140202
PORTREVISION=	1
CATEGORIES=	devel
MASTER_SITES=	http://erislabs.net/ianb/projects/gnulib/
DISTNAME=	${PORTNAME}-${PORTVERSION}-stable

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNU portability library

LICENSE=	lgpl gpl2 lgpl2.1 gpl3 lgpl3
LICENSE_COMB=	multi

BUILD_DEPENDS=	${LOCALBASE}/bin/makeinfo:${PORTSDIR}/print/texinfo

USES=		gmake perl5 shebangfix
SHEBANG_FILES=	check-module

PLIST_FILES=	bin/check-module bin/gnulib-tool \
		share/gnulib/check-module \
		share/gnulib/gnulib-tool
INFO=		${PORTNAME}
PORTDOCS=	gnulib.html
PORTDATA=	*

OPTIONS_DEFINE=	DOCS

post-patch:
	${REINPLACE_CMD} -e 's/date -u.*/stat -f %Sa -t "@set UPDATED %F %T" `ls -t $$^ | sed 1q` > $$@/' \
		-e 's: makeinfo$$: ${LOCALBASE}/bin/makeinfo:' \
		${WRKSRC}/doc/Makefile

do-build:
	cd ${WRKSRC} && ${SETENV} ${MAKE_ENV} ${MAKE_CMD} -C doc info html

do-install:
	${MKDIR} ${DATADIR} ${PREFIX}/${INFO_PATH}
	for p in check-module gnulib-tool;\
		do ${INSTALL_SCRIPT} ${WRKSRC}/$$p ${DATADIR};\
			cd ${PREFIX}/bin;\
			${LN} -s ../${DATADIR_REL}/$$p;\
		done
	${TAR} -cf - -C ${WRKSRC} build-aux config doc lib m4 modules \
		tests top | ${TAR} -xof - -C ${DATADIR}
	${INSTALL_DATA} ${WRKSRC}/doc/gnulib.info \
		${PREFIX}/${INFO_PATH}
	${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/doc/gnulib.html ${DOCSDIR}

.include <bsd.port.mk>
