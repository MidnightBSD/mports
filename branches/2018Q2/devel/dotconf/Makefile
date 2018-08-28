# $MidnightBSD$

PORTNAME=	dotconf
PORTVERSION=	1.3
CATEGORIES=	devel
MASTER_SITES=	GENTOO

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Simple, powerful configuration-file parser

LICENSE=	lgpl2.1

OPTIONS_DEFINE=	DOCS EXAMPLES

USES=		pathfix pkgconfig libtool
GNU_CONFIGURE=	yes
INSTALL_TARGET=	install-strip
USE_LDCONFIG=	yes

post-patch:
	@${REINPLACE_CMD} -e \
		'/^SUBDIR/s|=.*|= src|' ${WRKSRC}/Makefile.in

post-install:
	@${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/doc/*.txt ${DOCSDIR}
	@${MKDIR} ${EXAMPLESDIR}
.for ex in README argdouble caseinsensitive context duplicates errorhandler \
	fallback libpool maketest.sh modules noinline simple
	@(cd ${WRKSRC}/examples && ${COPYTREE_SHARE} ${ex} ${EXAMPLESDIR})
.endfor

.include <bsd.port.mk>
