PORTNAME=	gnutls
DISTVERSION=	3.8.9
CATEGORIES=	security net
MASTER_SITES=	GNUPG/${PORTNAME}/v${DISTVERSION:C/(\.[^.]*).*/\1/}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNU Transport Layer Security library
WWW=		https://gnutls.org/

LICENSE=	gpl3+ lgpl2.1+
LICENSE_COMB=	multi

LIB_DEPENDS=	libgmp.so:math/gmp \
		libnettle.so:security/nettle \
		libtasn1.so:security/libtasn1 \
		libunistring.so:devel/libunistring

USES=		compiler:c11 cpe gmake iconv libtool localbase makeinfo \
		pkgconfig tar:xz
CPE_VENDOR=	gnu
USE_LDCONFIG=	yes

#magus
NO_TEST=	yes

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--disable-rpath \
		--enable-ld-version-script \
		--enable-openssl-compatibility \
		--with-default-trust-store-dir=/etc/ssl/certs \
		--with-system-priority-file=${PREFIX}/etc/gnutls/config \
		--without-brotli \
		--without-included-libtasn1 \
		--without-tpm \
		--without-tpm2 \
		--without-zstd

MAKE_ENV=	MAKEINFOFLAGS=--no-split
INSTALL_TARGET=	install-strip
TEST_TARGET=	check

LDFLAGS+=	-Wl,--undefined-version

WRKSRC=		${WRKDIR}/${PORTNAME}-${DISTVERSION:C/(\.[^.]*\.[^.]*).*/\1/}

INFO=		gnutls

OPTIONS_DEFINE=		DANE EXAMPLES IDN MAN3 NLS P11KIT SRP
OPTIONS_DEFAULT=	IDN MAN3 P11KIT
OPTIONS_SUB=		yes

DANE_DESC=		Certificate verification via DNSSEC
MAN3_DESC=		Install API manpages (section 3)
P11KIT_DESC=		PKCS\#11 and p11-kit support
SRP_DESC=		Secure Remote Password support

DANE_LIB_DEPENDS=	libunbound.so:dns/unbound
DANE_CONFIGURE_ENABLE=	libdane

IDN_LIB_DEPENDS=	libidn2.so:dns/libidn2
IDN_CONFIGURE_WITH=	idn

NLS_USES=		gettext
NLS_CONFIGURE_OFF=	ac_cv_lib_intl_gettext=no
NLS_CONFIGURE_ENABLE=	nls

P11KIT_LIB_DEPENDS=	libp11-kit.so:security/p11-kit
P11KIT_CONFIGURE_ON=	--with-default-trust-store-pkcs11="pkcs11:model=p11-kit-trust;manufacturer=PKCS%2311%20Kit"
P11KIT_CONFIGURE_WITH=	p11-kit

SRP_CONFIGURE_ENABLE=	srp-authentication

.include <bsd.mport.options.mk>

post-patch:
	@${RM} ${WRKSRC}/doc/*.info*
	@${REINPLACE_CMD} 's,/usr/share,${PREFIX}/share,' \
		${WRKSRC}/doc/manpages/*.[13]
	@${REINPLACE_CMD} -E 's,/etc/(gnutls|tpasswd),${PREFIX}&,g' \
		${WRKSRC}/doc/cha-config.texi \
		${WRKSRC}/doc/gnutls-api.texi \
		${WRKSRC}/doc/invoke-certtool.texi \
		${WRKSRC}/doc/invoke-gnutls-cli.texi \
		${WRKSRC}/doc/invoke-gnutls-serv.texi \
		${WRKSRC}/doc/invoke-p11tool.texi \
		${WRKSRC}/doc/invoke-srptool.texi \
		${WRKSRC}/doc/srptool-examples.texi \
		${WRKSRC}/doc/manpages/certtool.1 \
		${WRKSRC}/doc/manpages/gnutls_priority_init2.3 \
		${WRKSRC}/doc/manpages/gnutls-cli.1 \
		${WRKSRC}/doc/manpages/gnutls-serv.1 \
		${WRKSRC}/doc/manpages/p11tool.1 \
		${WRKSRC}/doc/manpages/srptool.1 \
		${WRKSRC}/lib/includes/gnutls/pkcs11.h \
		${WRKSRC}/lib/pkcs11.c \
		${WRKSRC}/src/p11tool-options.c \
		${WRKSRC}/src/srptool.c
	@${REINPLACE_CMD} \
		's,/etc/pkcs11/modules,${PREFIX}/share/p11-kit/modules,' \
		${WRKSRC}/doc/cha-tokens.texi \
		${WRKSRC}/doc/invoke-p11tool.texi \
		${WRKSRC}/doc/manpages/p11tool.1 \
		${WRKSRC}/src/p11tool-options.c
# Prevent regeneration.  The order is important.
	@${TOUCH} ${WRKSRC}/doc/enums.texi \
		${WRKSRC}/doc/invoke-gnutls-cli.texi \
		${WRKSRC}/doc/invoke-gnutls-cli-debug.texi \
		${WRKSRC}/doc/invoke-gnutls-serv.texi \
		${WRKSRC}/doc/invoke-certtool.texi \
		${WRKSRC}/doc/invoke-ocsptool.texi \
		${WRKSRC}/doc/invoke-danetool.texi \
		${WRKSRC}/doc/invoke-srptool.texi \
		${WRKSRC}/doc/invoke-psktool.texi \
		${WRKSRC}/doc/invoke-p11tool.texi \
		${WRKSRC}/doc/invoke-tpmtool.texi \
		${WRKSRC}/doc/pkcs11-api.texi \
		${WRKSRC}/doc/manpages/stamp_mans \
		${WRKSRC}/doc/stamp_enums \
		${WRKSRC}/doc/stamp_functions

post-install:
	@${RM} ${STAGEDIR}${DOCSDIR}/*.png
	@${RMDIR} ${STAGEDIR}${DOCSDIR}
	@${MKDIR} ${STAGEDIR}${EXAMPLESDIR}
	${INSTALL_DATA} ${WRKSRC}/doc/examples/*.[ch] ${STAGEDIR}${EXAMPLESDIR}

.include <bsd.port.mk>
