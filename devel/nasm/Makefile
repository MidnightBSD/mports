# Created by: Murray Stokely <murray@cdrom.com>

PORTNAME=	nasm
PORTVERSION=	2.14.02
PORTEPOCH=	1
CATEGORIES=	devel lang
MASTER_SITES=	https://www.nasm.us/pub/nasm/releasebuilds/${PORTVERSION}/ \
		https://mirror.sobukus.de/files/src/nasm/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	General-purpose multi-platform x86 and amd64 assembler

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/LICENSE

GNU_CONFIGURE=	yes
CONFIGURE_ENV=	ac_cv_func_strspn=yes
USES=		tar:xz gmake
MAKE_ARGS+=	INSTALLROOT=${FAKE_DESTDIR}
INSTALL_TARGET=	install #needed for RDOFF_INSTALL_TARGET

OPTIONS_DEFINE=	RDOFF DOCS
OPTIONS_DEFAULT=RDOFF
OPTIONS_SUB=	yes

RDOFF_DESC=		Install tools to handle RDOFF object files
RDOFF_INSTALL_TARGET=	install_rdf

DOCS_DISTFILES=	${DISTNAME}${EXTRACT_SUFX} ${DISTNAME}-xdoc${EXTRACT_SUFX}
PORTDOCS=	*

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	(cd ${WRKSRC}/doc && ${COPYTREE_SHARE} html ${FAKE_DESTDIR}${DOCSDIR})
	${INSTALL_DATA} ${WRKSRC}/doc/nasmdoc.txt ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
