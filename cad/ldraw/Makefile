PORTNAME=	ldraw
DISTVERSION=	20220211
PORTEPOCH=	1
CATEGORIES=	cad
MASTER_SITES=	https://www.ldraw.org/library/updates/:parts \
		https://www.ldraw.org/library/official/:config
DISTFILES=	complete.zip:parts LDConfig.ldr:config
DIST_SUBDIR=	${DISTNAME}-${DISTVERSION}
EXTRACT_ONLY=	complete.zip

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	LDraw-format CAD files representing many of LEGO bricks produced
WWW=		https://www.ldraw.org/

LICENSE=	CC-BY-2.0

USES=		zip

NO_BUILD=	yes
NO_ARCH=	yes

do-install:
	@${MKDIR} ${PREFIX}/share/ldraw
	cd ${WRKDIR}/ldraw && \
		${COPYTREE_SHARE} p ${PREFIX}/share/ldraw && \
		${COPYTREE_SHARE} parts ${PREFIX}/share/ldraw
	${INSTALL_DATA} ${DISTDIR}/${DIST_SUBDIR}/LDConfig.ldr ${PREFIX}/share/ldraw

post-install: # autoplist: ~16k files all under share/ldraw
	@cd ${PREFIX} && \
		${FIND} * -type f >> ${TMPPLIST}

.include <bsd.port.mk>
