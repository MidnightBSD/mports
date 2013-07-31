# $MidnightBSD: mports/www/lynx/Makefile,v 1.10 2013/01/17 03:34:04 laffer1 Exp $

PORTNAME=	lynx
PORTVERSION=	2.8.7.2
PORTREVISION=	0
CATEGORIES=	www ipv6
MASTER_SITES=	http://lynx.isc.org/current/
DISTNAME=	${PORTNAME}${PORTVERSION:R}rel.${PORTVERSION:E}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A non-graphical, text-based World-Wide Web client
LICENSE=	gpl2

MAKE_JOBS_UNSAFE=yes

USE_BZIP2=	yes
USE_OPENSSL=	yes
WRKSRC=		${WRKDIR}/${PORTNAME}2-8-7
GNU_CONFIGURE=	yes
CONFIGURE_ARGS+=--with-zlib --libdir="${L_LIB}" \
		--enable-nsl-fork --enable-persistent-cookies

_FAKE_SETUP += DOCSDIR=${FAKE_DESTDIR}${DOCSDIR}
TARGET_DIR=	${DESTDIR}${PREFIX}

OPTIONS=	SSL		"SSL Support" on \
		DEFAULT_COLORS "Colors Support" off \
		IPV6		"IPv6 Support" off

.include <bsd.port.pre.mk>

.if ${OSVERSION} < 3000
CONFIGURE_ARGS+=	--with-screen=ncurses
.else
CONFIGURE_ARGS+=	--with-screen=ncursesw
.endif

.if defined(WITH_DEFAULT_COLORS)
CONFIGURE_ARGS+=--enable-default-colors
.endif

.if defined(WITH_SSL)
CONFIGURE_ARGS+=	--with-ssl=${OPENSSLBASE}
.endif

.if defined(WITH_IPV6) && !defined(NO_INET6)
CONFIGURE_ARGS+=	--enable-ipv6
.endif

MAKE_ARGS=	helpdir=${L_HELP} docdir=${DOCSDIR}
MAKEFILE=	makefile
INSTALL_TARGET=	install-full
MAN1=		lynx.1

L_LIB=		${PREFIX}/etc
L_HELP=		${PREFIX}/share/lynx_help

post-patch:
	@${RM} -f ${WRKSRC}/CHANGES.orig

post-install:
	${INSTALL_DATA} ${WRKSRC}/samples/lynx.lss ${L_LIB}
	${CHOWN} -R ${SHAREOWN}:${SHAREGRP} ${DOCSDIR}
	${CHOWN} -R ${SHAREOWN}:${SHAREGRP} ${L_HELP}
	${CHOWN} ${SHAREOWN}:${SHAREGRP} ${L_LIB}/lynx.cfg ${L_LIB}/lynx.lss

.include <bsd.port.post.mk>
