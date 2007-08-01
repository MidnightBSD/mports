# New ports collection makefile for:	linuxpluginwrapper
# Date Created:				2003-06-15
# Whom:					nork@FreeBSD.org
#
# $MidnightBSD: mports/www/linuxpluginwrapper/Makefile,v 1.1 2006/10/04 20:09:14 laffer1 Exp $
# $FreeBSD: ports/www/linuxpluginwrapper/Makefile,v 1.55 2006/06/14 16:04:30 hrs Exp $
#

PORTNAME=	linuxpluginwrapper
PORTVERSION=	20051113
PORTREVISION=	4
CATEGORIES=	www linux emulators
MASTER_SITES=	http://people.FreeBSD.org/~nork/distfiles/ \
		${MASTER_SITE_LOCAL}
MASTER_SITE_SUBDIR=	nork

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A wrapper allowing use of linux-plugins with native applications

OPTIONS=	REALPLAYER	"install linux-realplayer"	off \
		ACROREAD	"install acroread7"	off

.include <bsd.port.pre.mk>

# I will remove WITH_PLUGINS knob.
.if		defined(WITH_REALPLAYER)
RUN_DEPENDS+=	${X11BASE}/lib/linux-mozilla/plugins/nphelix.so:${PORTSDIR}/multimedia/linux-realplayer
WITH_PLUGINS=	1
.endif
.if		defined(WITH_ACROREAD)
RUN_DEPENDS+=	${X11BASE}/Adobe/Acrobat7.0/ENU/Browser/intellinux/nppdf.so:${PORTSDIR}/print/acroread7
WITH_PLUGINS=	1
.endif

ONLY_FOR_ARCHS=	i386
MAKE_ENV=	EXAMPLESDIR=${EXAMPLESDIR} INSTALL_DATA="${INSTALL_DATA}" INSTALL_PROGRAM="${INSTALL_PROGRAM}"

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
	@${SED} -e 's,%%PREFIX%%,${PREFIX},' \
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
	@${MKDIR} ${X11BASE}/lib/browser_linux_plugins
.if		defined(WITH_ACROREAD)
	@${LN} -sf ${X11BASE}/Adobe/Acrobat7.0/ENU/Browser/intellinux/nppdf.so \
		${X11BASE}/lib/browser_linux_plugins/
.endif
.if		defined(WITH_REALPLAYER)
	@${LN} -sf ${X11BASE}/lib/linux-mozilla/plugins/nphelix.so \
		${X11BASE}/lib/browser_linux_plugins/
	@${LN} -sf ${X11BASE}/lib/linux-mozilla/plugins/nphelix.xpt \
		${X11BASE}/lib/browser_linux_plugins/
.endif
.endif

post-install:
	@${CAT} ${PKGMESSAGE}

.include <bsd.port.post.mk>
