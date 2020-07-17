# $MidnightBSD$

PORTNAME=	fsharp
PORTVERSION=	4.0.1.15
CATEGORIES=	lang
EXTRACT_ONLY=	${DISTNAME}${EXTRACT_SUFX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Functional and object-oriented language for the .NET platform

LICENSE=	apache2
LICENSE_FILE=	${WRKSRC}/LICENSE

EXTRACT_DEPENDS=  ${LOCALBASE}/bin/bsdtar:archivers/libarchive
BUILD_DEPENDS=	mono>=3.0:lang/mono \
		referenceassemblies-pcl>=4.6:lang/referenceassemblies-pcl
RUN_DEPENDS=	mono>=3.0:lang/mono

NUGET_DEPENDS=	FSharp.Compiler.Tools=4.0.1.3 \
		FSharp.Data=2.2.5 \
		FSharp.SRGen.Build.Tasks=3.0.0 \
		fssrgen=3.0.0 \
		Microsoft.DiaSymReader=1.0.8 \
		Microsoft.DiaSymReader.PortablePdb=1.1.0 \
		System.Collections.Immutable=1.2.0 \
		System.Reflection.Metadata=1.4.1-beta-24227-04

USE_GITHUB=	yes

USES=		autoreconf gmake mono:nuget pkgconfig libarchive
DISTFILES+=	fsharp-4.0.1.15_GH0.tar.gz
GNU_CONFIGURE=	yes
MAKE_JOBS_UNSAFE=	Build not parallelizable
NO_ARCH=	yes

NO_TEST=	yes

.include <bsd.port.mk>
