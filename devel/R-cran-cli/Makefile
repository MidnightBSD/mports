PORTNAME=	cli
DISTVERSION=	3.6.5
CATEGORIES=	devel
DISTNAME=	${PORTNAME}_${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Helpers for Developing Command Line Interfaces
WWW=		https://cran.r-project.org/package=cli

LICENSE=	mit

USES=		cran:auto-plist,compiles

# tets have circular depends so not included
NO_TEST=	yes

post-install:
	@${ECHO_CMD} "@dir ${R_MOD_DIR}/help/figures" >> ${TMPPLIST}

.include <bsd.port.mk>
