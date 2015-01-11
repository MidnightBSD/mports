# $MidnightBSD$

PORTNAME=	gmp
PORTVERSION=	5.1.3
PORTREVISION=	1
CATEGORIES=	math devel
MASTER_SITES=	${MASTER_SITE_GNU}
MASTER_SITE_SUBDIR=	gmp

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Free library for arbitrary precision arithmetic

LICENSE=	lgpl3

CONFLICTS=	libgmp-4.*

OPTIONS=	CPU_OPTS "Enable assembly optimizations for your CPU" off

USES=		libtool:keepla makeinfo tar:xz
GNU_CONFIGURE=	yes
CONFIGURE_ENV=	MAKEINFO="makeinfo --no-split"
CONFIGURE_ARGS=	--prefix=${PREFIX} \
		--infodir=${PREFIX}/info \
		--mandir=${PREFIX}/man \
		--enable-cxx
USE_LDCONFIG=	yes

INFO=		gmp

.include <bsd.port.pre.mk>

CONFIGURE_ARGS+=--build=${ARCH}-portbld-freebsd9.0

.if defined(WITH_CPU_OPTS)
.if ${ARCH:S/64//} != ${ARCH}
CONFIGURE_ENV+=	ABI="64"
.else
CONFIGURE_ENV+=	ABI="32"
.endif
.endif

post-extract:
	@${RM} -f ${WRKSRC}/doc/gmp.info*

post-patch:
	@${REINPLACE_CMD} "s/\(athlon64\-\*\-\*\)/amd64-*-* | \1/;s/\(x86_64)\)/amd64 | \1/" \
		${WRKSRC}/configure

regression-test check: build
	@cd ${WRKSRC} && ${SETENV} ${MAKE_ENV} ${MAKE} check

.include <bsd.port.post.mk>
