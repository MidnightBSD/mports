# Created by: Alex Dupre <ale@FreeBSD.org>
# $FreeBSD: head/ftp/php70-ftp/Makefile 408932 2016-02-15 14:34:26Z miwi $

CATEGORIES=	ftp

MASTERDIR=	${.CURDIR}/../../lang/php70

PKGNAMESUFFIX=	-ftp

post-patch:
	@${REINPLACE_CMD} s/HAVE_OPENSSL_EXT/__FreeBSD__/ \
		${WRKSRC}/ftp.* ${WRKSRC}/php_ftp.*

.include "${MASTERDIR}/Makefile"
