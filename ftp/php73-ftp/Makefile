# $FreeBSD: head/ftp/php73-ftp/Makefile 481525 2018-10-08 08:52:51Z tz $

CATEGORIES=	ftp

MASTERDIR=	${.CURDIR}/../../lang/php73

PKGNAMESUFFIX=	-ftp

TEST_TARGET=    test

post-patch:
	@${REINPLACE_CMD} s/HAVE_OPENSSL_EXT/__FreeBSD__/ \
		${WRKSRC}/ftp.* ${WRKSRC}/php_ftp.*

.include "${MASTERDIR}/Makefile"
