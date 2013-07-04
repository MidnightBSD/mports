# $MidnightBSD: mports/security/gnupg/Makefile,v 1.15 2011/05/11 13:46:10 laffer1 Exp $

PORTNAME=	gnupg
PORTVERSION=	2.0.18
CATEGORIES=	security
MASTER_SITES=	${MASTER_SITE_GNUPG}
MASTER_SITE_SUBDIR=	gnupg
DISTFILES=	${DISTNAME}${EXTRACT_SUFX} ${DISTNAME}${EXTRACT_SUFX}.sig
EXTRACT_ONLY=	${DISTNAME}${EXTRACT_SUFX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The GNU Privacy Guard
LICENSE=	gpl3

LIB_DEPENDS=	assuan.0:${PORTSDIR}/security/libassuan \
		gcrypt.18:${PORTSDIR}/security/libgcrypt \
		gpg-error.0:${PORTSDIR}/security/libgpg-error \
		ksba.19:${PORTSDIR}/security/libksba \
		pth.20:${PORTSDIR}/devel/pth

CONFLICTS=	gnupg1-[0-9]*

USE_BZIP2=	YES
USE_GMAKE=	YES
GNU_CONFIGURE=	YES
USE_ICONV=	YES
USE_LDCONFIG=	YES
USE_GETTEXT=	YES
CONFIGURE_TARGET=# empty
CONFIGURE_ARGS+=	--infodir=${PREFIX}/info --mandir=${PREFIX}/man \
	--enable-nls --enable-symcryptrun
.if defined(NOPORTDOCS)
CONFIGURE_ARGS+=      --disable-doc
.else
MAN1=		gpg2.1 gpgsm.1 gpgv2.1 gpg-agent.1 scdaemon.1 watchgnupg.1 \
		gpgconf.1 gpg-preset-passphrase.1 gpg-connect-agent.1 \
		gpgparsemail.1 symcryptrun.1 gpgsm-gencert.sh.1 gpg-zip.1
MAN8=		addgnupghome.8 applygnupgdefaults.8
INFO=		gnupg
.endif

OPTIONS=	LDAP "LDAP keyserver interface" off \
		NLS "National Language Support" off \
		SCDAEMON "Enable Smartcard daemon (with libusb)" off \
		CURL "Use the real curl library (worked around if no)" on \
		GPGSM "Enable GPGSM" on \
		CAMELLIA "Enable Camellia algorithm (for testing only)" off \
		KDNS "Use DNS CERT helper" off 

.include <bsd.port.pre.mk>

.if defined(WITHOUT_GPGSM)
CONFIGURE_ARGS+=--disable-gpgsm
PLIST_SUB+=	GPGSM="@comment "
.else
RUN_DEPENDS=	dirmngr:${PORTSDIR}/security/dirmngr
WITH_LDAP=	YES
PLIST_SUB+=	GPGSM=""
.endif

.if defined(WITH_LDAP)
USE_OPENLDAP=	YES
CONFIGURE_ARGS+=--with-ldap=${LOCALBASE}
PLIST_SUB+=	LDAP=""
.else
CONFIGURE_ARGS+=--disable-ldap
PLIST_SUB+=	LDAP="@comment "
.endif

.if defined(WITH_CAMELLIA) && !defined(WITHOUT_CAMELLIA)
CONFIGURE_ARGS+=--enable-camellia
.endif

.if defined(WITH_KDNS) && !defined(WITHOUT_KDNS)
LIB_DEPENDS+= adns:${PORTSDIR}/dns/adns
PLIST_SUB+=   ADNS=""
.else
CONFIGURE_SUB=        -e '/GPGKEYS_KDNS=/s/".*"/""/'
PLIST_SUB+=   ADNS="@comment "
.endif

.if defined(WITH_NLS)
USE_GETTEXT=	YES
CONFIGURE_ARGS+=--enable-nls
PLIST_SUB+=	NLS=""
.else
CONFIGURE_ARGS+=--disable-nls
PLIST_SUB+=	NLS="@comment "
.endif

.if defined(WITH_SCDAEMON)
CONFIGURE_ARGS+=--enable-scdaemon
LIB_DEPENDS+=	usb-0.1:${PORTSDIR}/devel/libusb
PLIST_SUB+=	SCDAEMON=""
.else
CONFIGURE_ARGS+=--disable-scdaemon
PLIST_SUB+=	SCDAEMON="@comment "
.endif

.if defined(WITHOUT_CURL)
CONFIGURE_ARGS+=--without-libcurl
.else
LIB_DEPENDS+=	curl:${PORTSDIR}/ftp/curl
CONFIGURE_ARGS+=--with-libcurl=${LOCALBASE}
.endif

verify:	checksum
	gpg2 --verify ${DISTDIR}/${DISTNAME}${EXTRACT_SUFX}.sig

pre-configure:
	${REINPLACE_CMD} -e "s@-lpthread@${PTHREAD_LIBS}@g" ${CONFIGURE_SUB} \
		${WRKSRC}/acinclude.m4 ${WRKSRC}/aclocal.m4 ${WRKSRC}/configure

post-install:
	PKG_PREFIX=${PREFIX} ${SH} ${PKGINSTALL} ${PKGNAME} POST-INSTALL

.include <bsd.port.post.mk>
