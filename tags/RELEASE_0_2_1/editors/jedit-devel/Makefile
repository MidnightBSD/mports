# New ports collection makefile for:    jedit-devel
# Date created:				02 Feb 2004
# Whom:					Linh Pham <question+fbsdports@closedsrc.org>
#
# $MidnightBSD: mports/editors/jedit-devel/Makefile,v 1.4 2008/04/30 21:51:50 laffer1 Exp $
# $FreeBSD: ports/editors/jedit-devel/Makefile,v 1.21 2007/10/05 21:54:51 miwi Exp $
#

PORTNAME=	jedit
DISTVERSION=	4.3.p14
PORTREVISION=	1
CATEGORIES=	editors java
MASTER_SITES=	SF
DISTNAME=	${PORTNAME}${PORTVERSION:S/.p/pre/}install
EXTRACT_SUFX=	.jar
EXTRACT_ONLY=

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Powerful programmer\'s text editor written in Java
LICENSE=	gpl2

BUILD_DEPENDS=	javavm:${PORTSDIR}/java/javavmwrapper
RUN_DEPENDS=	javavm:${PORTSDIR}/java/javavmwrapper

USE_JAVA=	yes
JAVA_VERSION=	1.5+
BUILD_DEPENDS+=         ${DEPEND_JAVA}
JAVA_RUN=	yes

CONFLICTS=	jedit-4.2*
NO_LATEST_LINK=	yes

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
