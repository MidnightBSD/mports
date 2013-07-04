# $MidnightBSD: mports/editors/jedit/Makefile,v 1.9 2011/08/21 18:14:27 laffer1 Exp $

PORTNAME=	jedit
PORTVERSION=	4.5.2
PORTEPOCH=	1
CATEGORIES=	editors java
MASTER_SITES=	SF
DISTNAME=	${PORTNAME}${PORTVERSION}install
EXTRACT_SUFX=	.jar
EXTRACT_ONLY=

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Powerful programmer\'s text editor written in Java
LICENSE=	gpl2

BUILD_DEPENDS=	javavm:${PORTSDIR}/java/javavmwrapper
RUN_DEPENDS=	javavm:${PORTSDIR}/java/javavmwrapper

CONFLICTS=	jedit-4.3.p*

USE_JAVA=	yes
JAVA_VERSION=	1.6+

USE_XORG=	x11
NO_BUILD=	yes

DATADIR=	${JAVASHAREDIR}/${PORTNAME}

SUB_FILES=	jedit.sh

MAN1=		jedit.1
# The complete PLIST is generated in post-install
PLIST_FILES=	bin/jedit

do-install:
	@${SED} "s|%%PREFIX%%|${PREFIX}| ; s|%%DATADIR%%|${DATADIR}| ; s|%%WRKDIR%%|${WRKDIR}|" ${FILESDIR}/instscript | \
		${SETENV} CLASSPATH=${DISTDIR}/${DISTNAME}.jar \
		${JAVA} installer.Install text
	@${INSTALL_SCRIPT} ${WRKDIR}/jedit.sh ${PREFIX}/bin/jedit

post-install:
	@${FIND} ${DATADIR} ! -type d | \
		${SED} 's,^${PREFIX}/,,' >> ${TMPPLIST}
	@${FIND} ${DATADIR} -type d | ${SORT} -r | \
		${SED} 's,^${PREFIX}/,@dirrm ,' >> ${TMPPLIST}

.include <bsd.port.mk>
