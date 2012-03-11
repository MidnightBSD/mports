# New ports collection makefile for:		linux-opera
# Date created:					December 6th 2000
# Whom:						des
#
# $MidnightBSD: mports/www/linux-opera/Makefile,v 1.14 2009/03/18 03:52:31 laffer1 Exp $
# $FreeBSD: ports/www/linux-opera/Makefile,v 1.78 2006/12/18 18:46:27 mezz Exp $
#

PORTNAME=	opera
PORTVERSION=	${OPERA_VER}
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
DISTNAME=	${PORTNAME}-${OPERA_VER}.gcc4-static-qt3.i386

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A blazingly fast, full-featured, standards-compliant browser
LICENSE=	opera

WRKSRC=		${WRKDIR}/${DISTNAME:S/.gcc/-${OPERA_BUILD}.gcc/}
USE_XLIB=	yes
USE_BZIP2=	yes
USE_LINUX=	yes
USE_LINUX_APPS= aspell naslibs png xorglibs
ONLY_FOR_ARCHS=	i386 amd64

NO_BUILD=	yes

OPERA_VER=	9.64
OPERA_BUILD=	2480
DATADIR=	${PREFIX}/share/${UNIQUENAME}
DOCSDIR=	${PREFIX}/share/doc/${UNIQUENAME}

MAN1=		linux-opera.1

post-extract:
	@${MV} ${WRKSRC}/usr/share/man/man1/opera.1 \
		${WRKSRC}/usr/share/man/man1/${UNIQUENAME}.1
	@${SED} -e 's|@PREFIX@|${LOCALBASE}|g' ${FILESDIR}/linux-opera.desktop.in >${WRKDIR}/linux-opera.desktop

post-patch:
	@${REINPLACE_CMD} -e 's|%%PREFIX%%|${PREFIX}|g ; \
		s|%%LOCALBASE%%|${LOCALBASE}|g ; s|%%X11BASE%%|${X11BASE}|g' \
			${WRKSRC}/install.sh ${WRKSRC}/usr/share/opera/ini/pluginpath.ini
	${REINPLACE_CMD} -e 's|FreeBSD|MidnightBSD|g' \
		${WRKSRC}/install.sh 
	@${REINPLACE_CMD} -e 's|man1/opera.1|man1/${UNIQUENAME}.1|g' \
		${WRKSRC}/Manifest.md5
	@${FIND} ${WRKSRC} -name '*.orig' -delete
	@${FIND} ${WRKSRC} -name '*.bak' -delete

do-install:
	@${MKDIR} ${PREFIX}/share/apps/Internet
	@${MKDIR} ${PREFIX}/share/applnk/Internet
	@${MKDIR} ${PREFIX}/share/applications
	@${MKDIR} ${PREFIX}/share/pixmaps
	@${INSTALL_DATA} ${WRKSRC}/usr/share/pixmaps/opera.xpm ${PREFIX}/share/pixmaps/linux-opera.xpm
	@(cd ${WRKSRC} && ./install.sh \
			--prefix=${TRUE_PREFIX} \
			--docdir=${TRUE_PREFIX}/share/doc/linux-opera \
			--sharedir=${TRUE_PREFIX}/share/linux-opera \
			--exec_prefix=${TRUE_PREFIX}/share/linux-opera/bin \
			--plugindir=${TRUE_PREFIX}/share/linux-opera/plugins \
			--DESTDIR=${FAKE_DESTDIR})
	@${INSTALL_DATA} ${WRKDIR}/linux-opera.desktop ${PREFIX}/share/apps/Internet/
	@${INSTALL_DATA} ${WRKDIR}/linux-opera.desktop ${PREFIX}/share/applnk/Internet/

# We must make sure that the correct java jar file is used after installation.
post-fake:
	${REINPLACE_CMD} -e 's|file://${FAKE_DESTDIR}${LOCALBASE}/share/linux-opera/java/opera.jar|file://${LOCALBASE}/share/linux-opera/java/opera.jar|g' \
		${FAKE_DESTDIR}${LOCALBASE}/share/linux-opera/java/opera.policy


.include <bsd.port.mk>
