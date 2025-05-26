PORTNAME=	pine-pgp-filters
PORTVERSION=	1.8
PORTREVISION=	2
CATEGORIES=	mail security
MASTER_SITES=	FREEBSD_LOCAL/marino
DISTFILES=	${DISTNAME}${EXTRACT_SUFX} ${DISTNAME}${EXTRACT_SUFX}.asc
EXTRACT_ONLY=	${DISTNAME}${EXTRACT_SUFX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Simple sh-based filters to use GnuPG with Alpine

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	gpg2:security/gnupg
RUN_DEPENDS=	alpine:mail/alpine \
		gpg2:security/gnupg

HAS_CONFIGURE=	yes
CONFIGURE_ARGS=	--prefix=${PREFIX}
NO_ARCH=	yes

PORTDOCS=	BUGS CHANGES INSTALL README
PLIST_FILES=	bin/ppf_mime bin/ppf_mime_decrypt \
		libexec/ppf_decrypt libexec/ppf_encrypt libexec/ppf_mime \
		libexec/ppf_mime_decrypt libexec/ppf_sign libexec/ppf_verify

OPTIONS_DEFINE=	DOCS

DOCS_SUB_FILES=	pkg-message

verify:	checksum
	gpg --verify ${DISTDIR}/${DISTNAME}${EXTRACT_SUFX}.asc

do-configure:
	@${MKDIR} ${FAKE_DESTDIR}${PREFIX}/libexec
	@(cd ${WRKSRC} && ./configure )

post-install-DOCS-on:
	${INSTALL} -d -o ${SHAREOWN} -g ${SHAREGRP} ${FAKE_DESTDIR}${DOCSDIR}
.for file in BUGS CHANGES INSTALL README
	${INSTALL_DATA} ${WRKSRC}/${file} ${FAKE_DESTDIR}${DOCSDIR}
.endfor

.include <bsd.port.mk>
