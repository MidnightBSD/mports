# $MidnightBSD$

PORTNAME=	libbind
PORTVERSION=	6.0
PORTREVISION=	5
CATEGORIES=	dns net ipv6
MASTER_SITES=	${MASTER_SITE_ISC}
MASTER_SITE_SUBDIR=	libbind/${PORTVERSION}
DISTFILES=	${DISTNAME}${EXTRACT_SUFX} ${DISTNAME}${EXTRACT_SUFX}.asc
EXTRACT_ONLY=	${DISTNAME}${EXTRACT_SUFX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Standard C resolver library

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYRIGHT

MAKE_JOBS_UNSAFE=	yes

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--localstatedir=/var --with-randomdev=/dev/random

OPTIONS_DEFINE=	IPV6 THREADS
OPTIONS_DEFAULT=	IPV6 THREADS

.include <bsd.port.pre.mk>

.if ${PORT_OPTIONS:MIPV6}
CONFIGURE_ARGS+=	--enable-ipv6
.else
CONFIGURE_ARGS+=	--disable-ipv6
.endif

.if ${PORT_OPTIONS:MTHREADS}
CONFIGURE_ARGS+=	--enable-threads
.else
CONFIGURE_ARGS+=	--disable-threads
.endif

verify:	checksum
	gpg --verify ${DISTDIR}/${DISTNAME}${EXTRACT_SUFX}.asc

post-patch:
.if ${OSVERSION} > 4015
	${CP} ${WRKSRC}/irs/irpmarshall.c ${WRKSRC}/irs/irpmarshall.c.dist
	${SED} -e 's/\#include \<utmp.h\>//' \
		${WRKSRC}/irs/irpmarshall.c.dist > ${WRKSRC}/irs/irpmarshall.c
.endif

.include <bsd.port.post.mk>
