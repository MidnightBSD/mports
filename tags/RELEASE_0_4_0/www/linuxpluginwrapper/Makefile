# New ports collection makefile for:	linuxpluginwrapper
# Date Created:				2003-06-15
# Whom:					nork@FreeBSD.org
#
# $MidnightBSD: mports/www/linuxpluginwrapper/Makefile,v 1.6 2008/10/08 03:58:50 laffer1 Exp $
# $FreeBSD: ports/www/linuxpluginwrapper/Makefile,v 1.55 2006/06/14 16:04:30 hrs Exp $
#

PORTNAME=	linuxpluginwrapper
PORTVERSION=	20051113
PORTREVISION=	8
CATEGORIES=	www linux emulators
MASTER_SITES=	http://people.FreeBSD.org/~nork/distfiles/ \
		${MASTER_SITE_FREEBSD_LOCAL}
MASTER_SITE_SUBDIR=	nork

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A wrapper allowing use of linux-plugins with native applications
LICENSE=	bsd2

OPTIONS=	REALPLAYER	"install linux-realplayer"	off \
		ACROREAD	"install acroread7"	off

.include <bsd.port.pre.mk>

.if		${OSVERSION} >= 3000
IGNORE=		doesn't support ELF symbol versioning, yet.
.endif

# I will remove WITH_PLUGINS knob.
.if		defined(WITH_REALPLAYER)
RUN_DEPENDS+=	${LOCALBASE}/lib/linux-mozilla/plugins/nphelix.so:${PORTSDIR}/multimedia/linux-realplayer
WITH_PLUGINS=	1
.endif
.if		defined(WITH_ACROREAD)
RUN_DEPENDS+=	${LOCALBASE}/Adobe/Acrobat7.0/ENU/Browser/intellinux/nppdf.so:${PORTSDIR}/print/acroread7
WITH_PLUGINS=	1
.endif

ONLY_FOR_ARCHS=	i386
MAKE_ENV=	EXAMPLESDIR=${FAKE_DESTDIR}${EXAMPLESDIR} INSTALL_DATA="${INSTALL_DATA}" INSTALL_PROGRAM="${INSTALL_PROGRAM}"

CONFLICTS=	flashpluginwrapper-*
USE_XLIB=	yes
PLIST_SUB=	LINUXBASE=${LINUXBASE}
PKGMESSAGE=	${WRKDIR}/pkg-message
.if		!defined(WITH_PLUGINS)
PLIST=		${WRKDIR}/pkg-plist
.endif

LIBMAPCONF=	${EXAMPLESDIR}/libmap.conf-FreeBSD6

RTLD=		/libexec/ld-elf.so.1

.if		defined(WITH_DEBUG)
CFLAGS+=	-DDEBUG=1
.endif

post-build:
	@${SED} -e 's,%%PREFIX%%,${FAKE_DESTDIR}${PREFIX},' \
		-e 's,%%LOCALBASE%%,${LOCALBASE},' \
		-e 's,%%X11BASE%%,${X11BASE},' \
		-e 's,%%LTHREADSHMAJOR%%,${LTHREADSHMAJOR},' \
		-e 's,%%LIBMAPCONF%%,${LIBMAPCONF},' \
		< ${.CURDIR}/pkg-message > ${PKGMESSAGE}
.if		!defined(WITH_PLUGINS)
	@${SED} -e "/exec/d" ${.CURDIR}/pkg-plist > ${PLIST}
.endif

.if		defined(WITH_PLUGINS)
pre-install:
	@${MKDIR} ${FAKE_DESTDIR}${X11BASE}/lib/browser_linux_plugins
.if		defined(WITH_ACROREAD)
	@${LN} -sf ${FAKE_DESTDIR}${X11BASE}/Adobe/Acrobat7.0/ENU/Browser/intellinux/nppdf.so \
		${FAKE_DESTDIR}${X11BASE}/lib/browser_linux_plugins/
.endif
.if		defined(WITH_REALPLAYER)
	@${LN} -sf ${FAKE_DESTDIR}${X11BASE}/lib/linux-mozilla/plugins/nphelix.so \
		${FAKE_DESTDIR}${X11BASE}/lib/browser_linux_plugins/
	@${LN} -sf ${FAKE_DESTDIR}${X11BASE}/lib/linux-mozilla/plugins/nphelix.xpt \
		${FAKE_DESTDIR}${X11BASE}/lib/browser_linux_plugins/
.endif
.endif

.include <bsd.port.post.mk>
