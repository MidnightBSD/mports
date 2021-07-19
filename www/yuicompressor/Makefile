PORTNAME=	yuicompressor
PORTVERSION=	2.4.8
PORTREVISION=	2
CATEGORIES=	www java
#MASTER_SITES=	http://tml.github.io/yui/
MASTER_SITES+=	FREEBSD_LOCAL/az
DISTNAME=	${PORTNAME}-${PORTVERSION}.jar
EXTRACT_SUFX=	# empty
EXTRACT_ONLY=	# empty

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The Yahoo! JavaScript and CSS Compressor

LICENSE=	bsd3 mpl
LICENSE_COMB=	multi

NO_WRKSUBDIR=	yes

USE_JAVA=	yes
NO_BUILD=	yes

PLIST_FILES=	bin/yuicompressor %%JAVAJARDIR%%/yuicompressor.jar
PLIST_DIRS=	%%JAVAJARDIR%%
SUB_FILES=	yuicompressor

.include <bsd.port.pre.mk>

do-install:
	@${MKDIR} ${JAVAJARDIR}
	${INSTALL_DATA} ${DISTDIR}/${DISTNAME} ${JAVAJARDIR}/yuicompressor.jar
	${INSTALL_SCRIPT} ${WRKDIR}/yuicompressor ${PREFIX}/bin

.include <bsd.port.post.mk>
