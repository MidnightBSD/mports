PORTNAME=	mpack
PORTVERSION=	1.6
PORTREVISION=	3
CATEGORIES=	converters mail news
MASTER_SITES=	ftp://ftp.andrew.cmu.edu/pub/mpack/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	External MIME packer/unpacker

LICENSE=	bsd3

USES=		cpe

CPE_VENDOR=	mpack_project

WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTVERSION}
GNU_CONFIGURE=	yes

PLIST_FILES=	bin/mpack bin/munpack \
		man/man1/mpack.1.gz man/man1/munpack.1.gz

.include <bsd.port.mk>
