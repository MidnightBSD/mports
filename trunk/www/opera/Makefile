# New ports collection makefile for:		opera
# Date created:					November 5th 2000
# Whom:						des
#
# $MidnightBSD: mports/www/opera/Makefile,v 1.22 2008/06/12 21:41:12 laffer1 Exp $
# $FreeBSD: ports/www/opera/Makefile,v 1.51 2006/08/10 08:42:06 simon Exp $
#

PORTNAME=	opera
PORTVERSION=	${OPERA_VER}
PORTREVISION=	0
CATEGORIES=	www ipv6
MASTER_SITES=	ftp://opera.inode.at/unix/freebsd/${OPERA_VER:S/.//}${OPERA_MINVER}/${OPERA_REL}/en/${OPERA_LIB}/ \
		http://gd.tuwien.ac.at/infosys/browsers/opera/unix/freebsd/${OPERA_VER:S/.//}${OPERA_MINVER}/${OPERA_REL}/en/${OPERA_LIB}/ \
		http://ftp.ucr.ac.cr/WWW/opera/unix/freebsd/${OPERA_VER:S/.//}${OPERA_MINVER}/${OPERA_REL}/en/${OPERA_LIB}/ \
		http://www.microrpm.ca/pub/opera/unix/freebsd/${OPERA_VER:S/.//}${OPERA_MINVER}/${OPERA_REL}/en/${OPERA_LIB}/ \
		http://www.opera.mirroarrr.de/unix/freebsd/${OPERA_VER:S/.//}${OPERA_MINVER}/${OPERA_REL}/en/${OPERA_LIB}/ \
		http://opera.eurenet.net/unix/freebsd/${OPERA_VER:S/.//}${OPERA_MINVER}/${OPERA_REL}/en/${OPERA_LIB}/ \
		ftp://opera.ftp.fu-berlin.de/unix/freebsd/${OPERA_VER:S/.//}${OPERA_MINVER}/${OPERA_REL}/en/${OPERA_LIB}/ \
		http://ftp.ntua.gr/pub/www/Opera/unix/freebsd/${OPERA_VER:S/.//}${OPERA_MINVER}/${OPERA_REL}/en/${OPERA_LIB}/ \
		ftp://ftp.wayne.edu/opera/unix/freebsd/${OPERA_VER:S/.//}${OPERA_MINVER}/${OPERA_REL}/en/${OPERA_LIB}/ \
		http://mirrors.dedipower.com/opera/unix/freebsd/${OPERA_VER:S/.//}${OPERA_MINVER}/${OPERA_REL}/en/${OPERA_LIB}/ \
		ftp://ftp.mirror.ac.uk/sites/ftp.opera.com/unix/freebsd/${OPERA_VER:S/.//}${OPERA_MINVER}/${OPERA_REL}/en/${OPERA_LIB}/ \
		http://opera.nedmirror.nl/unix/freebsd/${OPERA_VER:S/.//}${OPERA_MINVER}/${OPERA_REL}/en/${OPERA_LIB}/ \
		ftp://ftp.tiscali.nl/pub/mirrors/opera/unix/freebsd/${OPERA_VER:S/.//}${OPERA_MINVER}/${OPERA_REL}/en/${OPERA_LIB}/ \
		${MASTER_SITE_RINGSERVER:S,%SUBDIR%,net/www/opera/unix/freebsd/${OPERA_VER:S/.//}${OPERA_MINVER}/${OPERA_REL}/en/${OPERA_LIB}/&,} \
		ftp://ftp.opera.com/pub/opera/unix/freebsd/${OPERA_VER:S/.//}${OPERA_MINVER}/${OPERA_REL}/en/${OPERA_LIB}/
DISTNAME=	${PORTNAME}-${OPERA_VER}-freebsd6-shared-qt3.${ARCH}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A blazingly fast, full-featured, standards-compliant browser
LICENSE=	opera

OPERA_VER=	9.50
OPERA_MINVER=	
OPERA_REL=	final
OPERA_DATE=	20080331
OPERA_BUILD=	2042

DATADIR=	${PREFIX}/share/${PORTNAME}
DOCSDIR=	${PREFIX}/share/doc/${PORTNAME}

USE_BZIP2=	yes
WANT_GNOME=	yes
USE_XLIB=	yes
ONLY_FOR_ARCHS=	i386 amd64
WRKSRC=		${WRKDIR}/${DISTNAME}
WRKSRC=		${WRKDIR}/${PORTNAME}-${OPERA_VER}-${OPERA_BUILD}.freebsd6-shared-qt3.${ARCH}

MAN1=		opera.1
NO_BUILD=	yes

OPTIONS=	ASPELL	"Use the aspell library for spell checking"	on

.if exists(${LOCALBASE}/lib/libqt-mt.prl)
QT_PRESENT=	on
.else
QT_PRESENT=	off
.endif

.include <bsd.port.pre.mk>


OPERA_TYPE=	4

.if !defined(WITHOUT_ASPELL)
LIB_DEPENDS+=	aspell.16:${PORTSDIR}/textproc/aspell
.endif

.if ${ARCH} == amd64
OPERA_LIB=	amd64
.else
OPERA_LIB=	shared
.endif
LIB_DEPENDS+=	qt-mt:${PORTSDIR}/x11-toolkits/qt33

.if ${HAVE_GNOME:Mgnomehier}!=""
PLIST_SUB+=	GNOME=""
.else
PLIST_SUB+=	GNOME="@comment "
.endif

.if exists(${LOCALBASE}/bin/kde-config)
PLIST_SUB+=	KDE=""
.else
PLIST_SUB+=	KDE="@comment "
.endif

post-extract::
	@${SED} -e 's|@PREFIX@|${LOCALBASE}|g' ${FILESDIR}/opera.desktop.in >${WRKDIR}/opera.desktop

post-patch:
#	@${CP} ${WRKSRC}/search.ini ${WRKSRC}/locale/en
	@${REINPLACE_CMD} -e 's|%%PREFIX%%|${PREFIX}|g ; \
		s|%%LOCALBASE%%|${LOCALBASE}|g ; s|%%X11BASE%%|${X11BASE}|g' \
			${WRKSRC}/usr/local/etc/opera6rc
	@${FIND} ${WRKSRC} -name '*.orig' -delete
	@${FIND} ${WRKSRC} -name '*.bak' -delete

do-install:
	@(cd ${WRKSRC} && ./install.sh --prefix=${TRUE_PREFIX} --DESTDIR=${FAKE_DESTDIR})
	@${MKDIR} ${PREFIX}/share/apps/Internet
	@${MKDIR} ${PREFIX}/share/pixmaps
	@${MKDIR} ${PREFIX}/share/applnk/Internet
	@${MKDIR} ${PREFIX}/share/icons/hicolor/16x16/apps
	@${MKDIR} ${PREFIX}/share/icons/hicolor/22x22/apps
	@${MKDIR} ${PREFIX}/share/icons/hicolor/32x32/apps
	@${MKDIR} ${PREFIX}/share/icons/hicolor/48x48/apps
	@${INSTALL_DATA} ${WRKSRC}/usr/share/pixmaps/opera.xpm ${PREFIX}/share/pixmaps/opera.xpm
	@${INSTALL_DATA} ${WRKSRC}/usr/share/icons/hicolor/16x16/apps/opera.png ${PREFIX}/share/icons/hicolor/16x16/apps/opera.png
	@${INSTALL_DATA} ${WRKSRC}/usr/share/icons/hicolor/22x22/apps/opera.png ${PREFIX}/share/icons/hicolor/22x22/apps/opera.png
	@${INSTALL_DATA} ${WRKSRC}/usr/share/icons/hicolor/32x32/apps/opera.png ${PREFIX}/share/icons/hicolor/32x32/apps/opera.png
	@${INSTALL_DATA} ${WRKSRC}/usr/share/icons/hicolor/48x48/apps/opera.png ${PREFIX}/share/icons/hicolor/48x48/apps/opera.png
	@${INSTALL_DATA} ${WRKDIR}/opera.desktop ${PREFIX}/share/apps/Internet/
	@${INSTALL_DATA} ${WRKDIR}/opera.desktop ${PREFIX}/share/applnk/Internet/

.include <bsd.port.post.mk>
