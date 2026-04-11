PORTNAME=	autoconf
PORTVERSION=	1.1
CATEGORIES=	lang
MASTER_SITES=	http://forge.ocamlcore.org/frs/download.php/181/
PKGNAMEPREFIX=	ocaml-
DISTNAME=	${PKGNAMEPREFIX}${PORTNAME}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Autoconf module for ocaml

LICENSE=	other

NO_BUILD=	yes
WRKSRC=		${WRKDIR}/${PKGNAMEPREFIX}${PORTNAME}-1.0

DOCSDIR=	${PREFIX}/share/doc/${PKGNAMEPREFIX}${PORTNAME}
AC_SUBDIR=	${PREFIX}/share/aclocal
PLIST_FILES=	share/aclocal/ocaml.m4
OPTIONS_DEFINE=	DOCS
PORTDOCS=	*

do-install:
	${MKDIR} ${AC_SUBDIR}/
	${INSTALL_DATA} ${WRKSRC}/ocaml.m4 ${AC_SUBDIR}/
	${MKDIR} ${DOCSDIR}/
	${INSTALL_DATA} ${WRKSRC}/ocaml.m4.txt ${DOCSDIR}/

.include <bsd.port.mk>
