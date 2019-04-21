# $FreeBSD: head/ftp/php72-ftp/Makefile 475229 2018-07-24 08:44:32Z tz $

CATEGORIES=	ftp

MASTERDIR=	${.CURDIR}/../../lang/php72

PKGNAMESUFFIX=	-ftp

TEST_TARGET=    test

post-patch:
	@${REINPLACE_CMD} s/HAVE_OPENSSL_EXT/__FreeBSD__/ \
		${WRKSRC}/ftp.* ${WRKSRC}/php_ftp.*

.include "${MASTERDIR}/Makefile"
