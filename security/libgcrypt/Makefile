PORTNAME=	libgcrypt
DISTVERSION=	1.9.4
CATEGORIES=	security
MASTER_SITES=	GNUPG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	General purpose crypto library based on code used in GnuPG
WWW=		https://www.gnupg.org/software/libgcrypt/index.html

LICENSE=	gpl2 lgpl2.1
LICENSE_COMB=	multi

BUILD_DEPENDS=	libgpg-error>=1.32:security/libgpg-error
RUN_DEPENDS=	libgpg-error>=1.32:security/libgpg-error

USES=		cpe libtool makeinfo tar:bzip2
CPE_VENDOR=	gnupg
USE_CSTD=	gnu89
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--disable-drng-support
CONFIGURE_ENV=	MAKEINFO="makeinfo --no-split"
CONFIGURE_TARGET=${ARCH:S/amd64/x86_64/}-portbld-freebsd11.4
USE_LDCONFIG=	yes
#TEST_TARGET=	check
# magus issues
NO_TEST=	yes

DOCS=		AUTHORS ChangeLog ChangeLog-2011 INSTALL NEWS THANKS TODO \
		doc/HACKING doc/README.apichanges
PORTDOCS=	*

OPTIONS_DEFINE=		DOCS INFO STATIC
OPTIONS_DEFAULT=	DOCS INFO STATIC
OPTIONS_SUB=	yes

INFO_EXTRA_PATCHES_OFF=	${PATCHDIR}/extra-patch-no-info
INFO_CONFIGURE_ENV=	MAKEINFO="${MAKEINFO} --no-split"
INFO_INFO=		gcrypt
INFO_USES=	makeinfo

STATIC_CONFIGURE_ENABLE=	static

.include <bsd.mport.options.mk>

post-patch:
	@${RM} ${WRKSRC}/doc/gcrypt.info*
	@${REINPLACE_CMD} -e 's|ALIGN (3)|ALIGN (2)|g' ${WRKSRC}/mpi/i386/*.S

post-install:
	@${STRIP_CMD} ${PREFIX}/lib/${PORTNAME}.so

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	cd ${WRKSRC} && ${INSTALL_DATA} ${DOCS} ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
