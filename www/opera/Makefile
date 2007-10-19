# New ports collection makefile for:		opera
# Date created:					November 5th 2000
# Whom:						des
#
# $MidnightBSD: mports/www/opera/Makefile,v 1.11 2007/08/15 18:26:15 laffer1 Exp $
# $FreeBSD: ports/www/opera/Makefile,v 1.51 2006/08/10 08:42:06 simon Exp $
#

PORTNAME=	opera
PORTVERSION=	${OPERA_VER}.${OPERA_DATE}
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
DISTNAME=	${PORTNAME}-${OPERA_VER}-${OPERA_DATE}.${OPERA_TYPE}-${OPERA_LIB}-qt.i386.freebsd-en

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A blazingly fast, full-featured, standards-compliant browser

OPERA_VER=	9.24
OPERA_MINVER=	
OPERA_REL=	final
OPERA_DATE=	20071015
OPERA_BUILD=	671

DATADIR=	${PREFIX}/share/${PORTNAME}
DOCSDIR=	${PREFIX}/share/doc/${PORTNAME}

USE_BZIP2=	yes
WANT_GNOME=	yes
USE_XLIB=	yes
ONLY_FOR_ARCHS=	i386 amd64
WRKSRC=		${WRKDIR}/${DISTNAME}-${OPERA_BUILD}

MAN1=		opera.1
NO_BUILD=	yes
NO_FILTER_SHLIBS=yes

OPTIONS=	ASPELL	"Use the aspell library for spell checking"	on

.if exists(${X11BASE}/lib/libqt-mt.prl)
QT_PRESENT=	on
.else
QT_PRESENT=	off
.endif

.include <bsd.port.pre.mk>

OPERA_TYPE=	4

.if !defined(WITHOUT_ASPELL)
LIB_DEPENDS+=	aspell.16:${PORTSDIR}/textproc/aspell
.endif

OPERA_LIB=	shared
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

post-patch:
	@${CP} ${WRKSRC}/search.ini ${WRKSRC}/locale/en
	@${REINPLACE_CMD} -e 's|%%PREFIX%%|${PREFIX}|g ; \
		s|%%LOCALBASE%%|${LOCALBASE}|g ; s|%%X11BASE%%|${X11BASE}|g' \
			${WRKSRC}/install.sh ${WRKSRC}/ini/pluginpath.ini \
			${WRKSRC}/config/opera6rc
	@${FIND} ${WRKSRC} -name '*.orig' -delete
	@${FIND} ${WRKSRC} -name '*.bak' -delete

do-install:
	@(cd ${WRKSRC} && ./install.sh --prefix=${TRUE_PREFIX} --DESTDIR=${FAKE_DESTDIR})

post-install:
	@${MKDIR} -p ${PREFIX}/share/icons/hicolor/22x22/apps
	@${MKDIR} -p ${PREFIX}/share/icons/hicolor/32x32/apps
	@${MKDIR} -p ${PREFIX}/share/icons/hicolor/48x48/apps
	@${MKDIR} -p ${PREFIX}/share/icons/locolor/16x16/apps
	@${MKDIR} -p ${PREFIX}/share/icons/locolor/22x22/apps
	@${MKDIR} -p ${PREFIX}/share/icons/locolor/32x32/apps
	@${INSTALL_DATA} ${WRKSRC}/images/opera_16x16.png ${PREFIX}/share/icons/locolor/16x16/apps/opera.png
	@${INSTALL_DATA} ${WRKSRC}/images/opera_22x22.png ${PREFIX}/share/icons/locolor/22x22/apps/opera.png
	@${INSTALL_DATA} ${WRKSRC}/images/opera_22x22.png ${PREFIX}/share/icons/hicolor/22x22/apps/opera.png
	@${INSTALL_DATA} ${WRKSRC}/images/opera_32x32.png ${PREFIX}/share/icons/locolor/32x32/apps/opera.png
	@${INSTALL_DATA} ${WRKSRC}/images/opera_32x32.png ${PREFIX}/share/icons/hicolor/32x32/apps/opera.png
	@${INSTALL_DATA} ${WRKSRC}/images/opera_48x48.png ${PREFIX}/share/icons/hicolor/48x48/apps/opera.png

.include <bsd.port.post.mk>
