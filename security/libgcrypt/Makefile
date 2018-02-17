# $MidnightBSD$

PORTNAME=	libgcrypt
PORTVERSION=	1.8.2
CATEGORIES=	security
MASTER_SITES=	GNUPG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	General purpose crypto library based on code used in GnuPG

LICENSE=	gpl2 lgpl2.1
LICENSE_COMB=	multi

BUILD_DEPENDS=	libgpg-error>=1.25:${PORTSDIR}/security/libgpg-error
RUN_DEPENDS=	libgpg-error>=1.25:${PORTSDIR}/security/libgpg-error

USES=		libtool makeinfo tar:bzip2
CPE_VENDOR=	gnupg
USE_CSTD=	gnu89
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--disable-drng-support
CONFIGURE_ARGS=	--disable-drng-support
CONFIGURE_ENV=	MAKEINFO="makeinfo --no-split"
CONFIGURE_TARGET=${ARCH:S/amd64/x86_64/}-portbld-freebsd9.1
INSTALL_TARGET=	install-strip
USE_LDCONFIG=	yes

DOCS=		AUTHORS ChangeLog ChangeLog-2011 INSTALL NEWS README \
		README.GIT THANKS TODO doc/HACKING doc/README.apichanges
INFO=		gcrypt
PORTDOCS=	*

OPTIONS_DEFINE=	DOCS

.include <bsd.mport.options.mk>

.if ${ARCH} == "powerpc"
CONFIGURE_ARGS+=	--disable-asm

.elif ${ARCH} == "i386"
.if (${OSVERSION} < 4015)
CONFIGURE_ARGS+=	--disable-aesni-support
.endif

.endif

post-patch:
	${RM} -f ${WRKSRC}/doc/gcrypt.info*
	${REINPLACE_CMD} -e 's|ALIGN (3)|ALIGN (2)|g' ${WRKSRC}/mpi/i386/*.S

# Fix build without ASM on 8.x/amd64
.if ${OPSYS} == FreeBSD && ${ARCH} == "amd64" && ${OSVERSION} < 900000
USE_GCC=	any
EXTRA_PATCHES+=	${FILESDIR}/extra-patch-configure
.endif

# Fix crash at cipher/salsa20.c module on amd64
.if ${ARCH} == "amd64" && exists(/usr/bin/clang)
CFLAGS:=	${CFLAGS:N-O*} -O2
.endif

post-install:
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/lib/${PORTNAME}.so

.if ${PORT_OPTIONS:MDOCS}
	${MKDIR} ${STAGEDIR}${DOCSDIR}
	cd ${WRKSRC} && ${INSTALL_DATA} ${DOCS} ${STAGEDIR}${DOCSDIR}
.endif

regression-test: build
	cd ${WRKSRC} && ${MAKE_CMD} check

.include <bsd.port.mk>
