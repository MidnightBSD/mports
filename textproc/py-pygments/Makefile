# $MidnightBSD$

PORTNAME=	pygments
PORTVERSION=	1.3.1
PORTREVISION=	0
CATEGORIES=	textproc python
MASTER_SITES=	CHEESESHOP \
		http://nivi.interfree.it/distfiles/${PORTNAME}/
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	Pygments-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A syntax highlighter written in Python

LICENSE=	bsd2

USES=		python
USE_PYTHON=   distutils autoplist

PYDISTUTILS_PKGNAME=	Pygments

.if !defined(NOPORTDOCS)
DOCSDIR=	${PREFIX}/share/doc/${PKGNAMEPREFIX}${PORTNAME}
FIND_DOCS=	. -type f
MAN1=	pygmentize.1
MANCOMPRESSED=	no

post-install:
	@${INSTALL_DATA} ${WRKSRC}/docs/${MAN1} ${MANPREFIX}/man/man1/
	@${MKDIR} ${DOCSDIR}
	@cd ${WRKSRC}/docs/build && ${FIND} ${FIND_DOCS} -exec ${INSTALL_DATA} {} ${DOCSDIR}/{} ";"
.endif

.include <bsd.port.mk>
