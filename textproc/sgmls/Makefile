

PORTNAME=	sgmls
PORTVERSION=	1.1.91
CATEGORIES=	textproc
MASTER_SITES=	ftp://ftp.jclark.com/pub/sgmls/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	SGML parser

LICENSE=	other

USES=		tar:Z
WRKSRC=		${WRKDIR}/${PORTNAME}
HAS_CONFIGURE=	yes
INSTALL_TARGET=	install install.man
TEST_TARGET=	test

PROGS=		sgmls sgmlsasp rast
PORTDOCS=	ChangeLog LICENSE NEWS README TODO

OPTIONS_DEFINE=	DOCS

post-patch:
	@${REINPLACE_CMD} -e 's,/usr/local,${PREFIX},g' ${WRKSRC}/Makefile

post-build:
.for file in ${PROGS}
	@${STRIP_CMD} ${WRKSRC}/${file}
.endfor

post-install:
	@${MKDIR} ${STAGEDIR}${DOCSDIR}
.for f in ${PORTDOCS}
	${INSTALL_DATA} ${WRKSRC}/${f} ${STAGEDIR}${DOCSDIR}
.endfor

.include <bsd.port.mk>
