# $MidnightBSD: mports/dns/libbind/Makefile,v 1.1 2011/02/23 21:31:05 laffer1 Exp $

PORTNAME=	libbind
PORTVERSION=	6.0
PORTREVISION=	1
CATEGORIES=	dns net ipv6
MASTER_SITES=	${MASTER_SITE_ISC}
MASTER_SITE_SUBDIR=	libbind/${PORTVERSION}
DISTFILES=	${DISTNAME}${EXTRACT_SUFX} ${DISTNAME}${EXTRACT_SUFX}.asc
EXTRACT_ONLY=	${DISTNAME}${EXTRACT_SUFX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Standard C resolver library
LICENSE=	mit

MAKE_JOBS_UNSAFE=	yes

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--localstatedir=/var --with-randomdev=/dev/random

OPTIONS=	IPV6 "Compile with IPv6 support" on \
		THREADS	"Compile with thread support" on

.include <bsd.port.pre.mk>

.if !defined(WITHOUT_IPV6)
CONFIGURE_ARGS+=	--enable-ipv6
.else
CONFIGURE_ARGS+=	--disable-ipv6
.endif

.if !defined(WITHOUT_THREADS)
CONFIGURE_ARGS+=	--enable-threads
.else
CONFIGURE_ARGS+=	--disable-threads
.endif

MAN3=	getaddrinfo.3 gethostbyname.3 getipnodebyname.3 getnameinfo.3 \
	getnetent.3 hesiod.3 inet_cidr.3 resolver.3 tsig.3
MAN5=	resolver.5 irs.conf.5
MAN7=	hostname.7

verify:	checksum
	gpg --verify ${DISTDIR}/${DISTNAME}${EXTRACT_SUFX}.asc

post-patch:
.if ${OSVERSION} > 4015
	${CP} ${WRKSRC}/irs/irpmarshall.c ${WRKSRC}/irs/irpmarshall.c.dist
	${SED} -e 's/\#include \<utmp.h\>//' \
		${WRKSRC}/irs/irpmarshall.c.dist > ${WRKSRC}/irs/irpmarshall.c
.endif

.include <bsd.port.post.mk>
