# New ports collection makefile for:	libdnet
# Date created:				15 April 2002
# Whom:			Dominic Marks <dominic.marks@btinternet.com>
#
# $MidnightBSD: mports/net/libdnet/Makefile,v 1.4 2008/05/04 09:56:12 crash Exp $
# $FreeBSD: ports/net/libdnet/Makefile,v 1.21 2006/02/23 10:38:21 ade Exp $
#

PORTNAME=	libdnet
PORTVERSION=	1.11
CATEGORIES=	net
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=	${PORTNAME}
.if defined(BUILD_PYTHON_MODULE)
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
.endif

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A simple interface to low level networking routines
LICENSE=        bsd3

GNU_CONFIGURE=	yes
CONFIGURE_TARGET=--build=${MACHINE_ARCH}-portbld-freebsd6.0
USE_GMAKE=	yes

SLAVE_DIRS=	net/py-libdnet

.if defined(BUILD_PYTHON_MODULE)
USE_PYTHON=	yes
CONFIGURE_ARGS+=	--with-python
INSTALL_WRKSRC=	${BUILD_WRKSRC}/python
PLIST_FILES=	%%PYTHON_SITELIBDIR%%/dnet.so
PLIST_SUB+=	MASTER="@comment "
.else
CONFIGURE_ARGS+=	--without-python
USE_LDCONFIG=	yes
PLIST_SUB+=	MASTER=""

MAN3=	dnet.3
MAN8=	dnet.8
.endif

.include <bsd.port.pre.mk>

.if !defined(LIBDNET_SLAVE)

post-patch:
	@${REINPLACE_CMD} -e 's|echo aout|echo elf|' ${WRKSRC}/configure

post-build:
	@cd ${WRKSRC}/src ; ${CC} ${CFLAGS} -shared -o libdnet.so .libs/addr-util.o .libs/addr.o .libs/blob.o .libs/ip-util.o .libs/ip6.o .libs/rand.o .libs/arp-bsd.o .libs/eth-bsd.o .libs/fw-pf.o .libs/intf.o .libs/ip.o .libs/route-bsd.o .libs/tun-bsd.o

post-install:
	${INSTALL_PROGRAM} ${WRKSRC}/src/${PORTNAME}.so ${PREFIX}/lib/
	@${LN} ${PREFIX}/lib/${PORTNAME}.so ${PREFIX}/lib/${PORTNAME}.so.1
.endif

.include <bsd.port.post.mk>
