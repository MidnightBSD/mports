# New ports collection makefile for:		linux-opera
# Date created:					December 6th 2000
# Whom:						des
#
# $MidnightBSD: mports/www/linux-opera/Makefile,v 1.8 2008/04/10 17:23:51 laffer1 Exp $
# $FreeBSD: ports/www/linux-opera/Makefile,v 1.78 2006/12/18 18:46:27 mezz Exp $
#

PORTNAME=	opera
PORTVERSION=	${OPERA_VER}.${OPERA_DATE}
PORTREVISION=	1
CATEGORIES=	www linux
MASTER_SITES=	ftp://ftp.opera.com/pub/opera/linux/${OPERA_VER:S/.//}/final/en/i386/static/ \
		ftp://ftp.sunet.se/pub/www/clients/Opera/linux/${OPERA_VER:S/.//}/final/en/i386/static/ \
		ftp://sunsite.cnlab-switch.ch/mirror/opera/linux/${OPERA_VER:S/.//}/final/en/i386/static/ \
		ftp://ftp.tiscali.nl/pub/mirrors/opera/linux/${OPERA_VER:S/.//}/final/en/i386/static/ \
		ftp://ftp.ntua.gr/pub/www/Opera/linux/${OPERA_VER:S/.//}/final/en/i386/static/ \
		http://mirrors.pmmf.hu/mirror/opera/linux/${OPERA_VER:S/.//}/final/en/i386/static/ \
		ftp://ftp.task.gda.pl/pub/opera/linux/${OPERA_VER:S/.//}/final/en/i386/static/ \
		ftp://ftp.planetmirror.com/pub/opera/linux/${OPERA_VER:S/.//}/final/en/i386/static/ \
		http://gd.tuwien.ac.at/infosys/browsers/opera/linux/${OPERA_VER:S/.//}/final/en/i386/static/ \
		${MASTER_SITE_RINGSERVER:S,%SUBDIR%,net/www/opera/linux/${OPERA_VER:S/.//}/final/en/i386/static/&,}
PKGNAMEPREFIX=	linux-
DISTNAME=	${PORTNAME}-${OPERA_VER}-${OPERA_DATE}.1-static-qt.i386-en

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A blazingly fast, full-featured, standards-compliant browser
LICENSE=	restricted

RUN_DEPENDS=	${LINUXBASE}/usr/lib/libaspell.so.15:${PORTSDIR}/textproc/linux-aspell

WRKSRC=		${WRKDIR}/${DISTNAME}-${OPERA_BUILD}
USE_XLIB=	yes
USE_BZIP2=	yes
USE_LINUX=	yes
ONLY_FOR_ARCHS=	i386 amd64

NO_BUILD=	yes

BROKEN=		There is a security issue with this verison of opera.

OPERA_VER=	9.27
OPERA_DATE=	20080331
OPERA_BUILD=	709

DATADIR=	${PREFIX}/share/${UNIQUENAME}
DOCSDIR=	${PREFIX}/share/doc/${UNIQUENAME}

MAN1=		linux-opera.1

post-patch:
	@${REINPLACE_CMD} -e 's|%%PREFIX%%|${PREFIX}|g ; \
		s|%%LOCALBASE%%|${LOCALBASE}|g ; s|%%X11BASE%%|${X11BASE}|g' \
			${WRKSRC}/install.sh ${WRKSRC}/ini/pluginpath.ini
	@${FIND} ${WRKSRC} -name '*.orig' -delete
	@${FIND} ${WRKSRC} -name '*.bak' -delete

do-install:
	${MKDIR} ${PREFIX}/share/applications
	${MKDIR} ${PREFIX}/share/pixmaps
	${INSTALL_DATA} ${WRKSRC}/images/opera.xpm ${PREFIX}/share/pixmaps/linux-opera.xpm
	@(cd ${WRKSRC} && ./install.sh \
			--prefix=${PREFIX} \
			--docdir=${DOCSDIR} \
			--sharedir=${DATADIR} \
			--exec_prefix=${DATADIR}/bin \
			--plugindir=${DATADIR}/plugins)

# We must make sure that the correct java jar file is used after installation.
post-fake:
	${REINPLACE_CMD} -e 's|file://${FAKE_DESTDIR}${LOCALBASE}/share/linux-opera/java/opera.jar|file://${LOCALBASE}/share/linux-opera/java/opera.jar|g' \
		${FAKE_DESTDIR}${LOCALBASE}/share/linux-opera/java/opera.policy


.include <bsd.port.mk>
