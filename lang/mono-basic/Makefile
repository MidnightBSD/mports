PORTNAME=	mono-basic
PORTVERSION=	4.7
CATEGORIES=	lang
MASTER_SITES=	http://download.mono-project.com/sources/${PORTNAME}/ \
		http://ftp.novell.com/pub/mono/sources/${PORTNAME}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	VisualBasic.NET support for Mono

LICENSE=        lgpl mit
LICENSE_COMB=   dual

HAS_CONFIGURE=	yes
CONFIGURE_ARGS=	--prefix=${PREFIX}
USES=		gmake mono tar:bzip2

NO_TEST=	yes

.include <bsd.port.mk>
