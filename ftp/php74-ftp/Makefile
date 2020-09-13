PORTREVISION=	1
CATEGORIES=	ftp

MASTERDIR=	${.CURDIR}/../../lang/php74

PKGNAMESUFFIX=	-ftp

NO_TEST=	yes

post-patch:
	@${REINPLACE_CMD} s/HAVE_OPENSSL_EXT/__FreeBSD__/ \
		${WRKSRC}/ftp.* ${WRKSRC}/php_ftp.*

.include "${MASTERDIR}/Makefile"
