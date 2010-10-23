# New ports collection makefile for:	screen
# Date created:         25 Nov 1994
# Whom:                 ache
#
# $MidnightBSD: mports/sysutils/screen/Makefile,v 1.7 2009/12/28 23:25:36 laffer1 Exp $
# $FreeBSD: ports/sysutils/screen/Makefile,v 1.62 2006/08/05 16:40:17 rafan Exp $
#

PORTNAME=	screen
PORTVERSION=	4.0.3
PORTREVISION=	1
CATEGORIES=	sysutils
MASTER_SITES=	ftp://ftp.uni-erlangen.de/pub/utilities/screen/ \
		${MASTER_SITE_GNU} \
		http://komquats.com/distfiles/ \
		http://people.freebsd.org/~cy/distfiles/
MASTER_SITE_SUBDIR=	screen

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A multi-screen window manager
LICENSE=	gpl2

GNU_CONFIGURE=	yes
MAN1=		screen.1
INFO=		screen

OPTIONS= 	XTERM_256 "256 color xterm support." Off \
		NETHACK   "Use Nethack witticisms." On \
		CJK	  "Treak CJK abiguous chars as full width." Off \
		HOSTINLOCKED "Print user@host in locked message" OFF \
		SHOWENC "Show encoding on the status line" OFF


.include <bsd.port.pre.mk>

# Enables support for 256 colour xterm.  Note that you may need to
# set up a custom termcap entry or .screenrc which modifies termcap
# to contain the following: Co#256:AB=\E[48;5;%dm:AF=\E[38;5;%dm
#
.if defined(WITH_XTERM_256)
CFLAGS+=	-DCOLORS256
.endif

.if !defined(WITH_NETHACK)
CFLAGS+=	-DNONETHACK
.endif

# treat CJK ambiguous characters as full width via option "cjkwidth"
.if defined(WITH_CJK)
EXTRA_PATCHES+=	${FILESDIR}/opt-cjkwidth
.endif

.if defined(WITH_HOSTINLOCKED)
EXTRA_PATCHES+=	${FILESDIR}/opt-hostinlocked
.endif

# show encoding on the status line via option "showenc"
.if defined(WITH_SHOWENC)
EXTRA_PATCHES+=	${FILESDIR}/opt-showencoding
.endif

post-patch:
	@${RM} ${WRKSRC}/doc/screen.info*
	@${REINPLACE_CMD} -e 's|/dev/ptmx|/nonexistent|' ${WRKSRC}/configure

post-install:
	@${MKDIR} ${EXAMPLESDIR}
	@${CP} ${WRKSRC}/etc/etcscreenrc ${EXAMPLESDIR}/screenrc

.include <bsd.port.post.mk>
