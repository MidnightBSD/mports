PORTNAME=	vpnc
PORTVERSION=	0.5.3
PORTREVISION=	6
CATEGORIES=	security
MASTER_SITES=	http://www.unix-ag.uni-kl.de/~massar/vpnc/ \
		FREEBSD_LOCAL/ehaupt

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Client for Cisco 3000 VPN Concentrator
WWW=		https://www.unix-ag.uni-kl.de/~massar/vpnc/

LICENSE=	gpl2+ bsd2
LICENSE_COMB=	multi
LICENSE_NAME_VPNC=	vpnc
LICENSE_FILE_BSD2CLAUSE=	${WRKSRC}/COPYING
LICENSE_FILE_GPLv2+ =	${WRKSRC}/COPYING
LICENSE_TEXT_VPNC=	Redistribution is not allowed if linked against OpenSSL
LICENSE_PERMS_VPNC=	auto-accept

LIB_DEPENDS=	libgcrypt.so:security/libgcrypt \
		libgpg-error.so:security/libgpg-error
RUN_DEPENDS=	vpnc-script:sysutils/vpnc-scripts

USES=		gmake perl5 shebangfix
USE_PERL5=	build
USE_RC_SUBR=	vpnc

LEGAL_TEXT=	Redistribution is not allowed if linked against OpenSSL

ALL_TARGET=	all
SHEBANG_FILES=	makeman.pl

PORTDOCS=	README TODO

MAKE_ENV=	BINS="${EXTRABUILDS}"

OPTIONS_DEFINE=		CISCOVERSION DECRYPT DOCS SSL
OPTIONS_DEFAULT=	DECRYPT
OPTIONS_SUB=		yes

CISCOVERSION_DESC=	Mask linux presentation string
CISCOVERSION_CFLAGS=	-DCISCO_PATCH_VERSION

DECRYPT_DESC=	cisco-decypt password decrypt utility
DECRYPT_VARS=	EXTRABUILDS+=cisco-decrypt

SSL_VARS=	NO_PACKAGE="binary linked against OpenSSL must not be redistributed" \
		LICENSE+=VPNC
SSL_CFLAGS=	-DOPENSSL_GPL_VIOLATION
SSL_LDFLAGS=	-lcrypto

post-patch:
	@${REINPLACE_CMD} \
		-e 's|.*%%FREEBSD_IPLEN_FIX%%.*|#define NEED_IPLEN_FIX 1|' \
		${WRKSRC}/sysdep.h
	@${REINPLACE_CMD} -e 's|%%PREFIX%%|${PREFIX}|' ${WRKSRC}/config.c
	@${REINPLACE_CMD} -e 's|\(/etc/vpnc\)|${PREFIX}\1|' \
		${WRKSRC}/vpnc.8.template

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/vpnc ${STAGEDIR}${PREFIX}/sbin/vpnc
	${INSTALL_SCRIPT} ${WRKSRC}/vpnc-disconnect \
		${STAGEDIR}${PREFIX}/sbin/vpnc-disconnect
	${INSTALL_DATA} ${WRKSRC}/vpnc.conf \
		${STAGEDIR}${PREFIX}/etc/vpnc.conf.sample
	${INSTALL_MAN} ${WRKSRC}/vpnc.8 ${STAGEDIR}${PREFIX}/share/man/man8

do-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	@cd ${WRKSRC} && ${INSTALL_DATA} ${PORTDOCS} ${FAKE_DESTDIR}${DOCSDIR}

do-install-DECRYPT-on:
	${INSTALL_PROGRAM} ${WRKSRC}/cisco-decrypt ${FAKE_DESTDIR}${PREFIX}/bin
	${INSTALL_MAN} ${WRKSRC}/cisco-decrypt.1 ${FAKE_DESTDIR}${PREFIX}/share/man/man1

.include <bsd.port.mk>
