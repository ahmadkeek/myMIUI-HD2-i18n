.class Lcom/miui/player/helper/AsyncMusicPlayer$MessageObj;
.super Ljava/lang/Object;
.source "AsyncMusicPlayer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/player/helper/AsyncMusicPlayer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MessageObj"
.end annotation


# instance fields
.field public final exception:Ljava/lang/Exception;

.field public final extra:Ljava/lang/Object;

.field public final path:Ljava/lang/String;

.field final synthetic this$0:Lcom/miui/player/helper/AsyncMusicPlayer;


# direct methods
.method public constructor <init>(Lcom/miui/player/helper/AsyncMusicPlayer;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Exception;)V
    .locals 0
    .parameter
    .parameter "pathA"
    .parameter "extraA"
    .parameter "tagA"

    .prologue
    .line 80
    iput-object p1, p0, Lcom/miui/player/helper/AsyncMusicPlayer$MessageObj;->this$0:Lcom/miui/player/helper/AsyncMusicPlayer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 81
    iput-object p2, p0, Lcom/miui/player/helper/AsyncMusicPlayer$MessageObj;->path:Ljava/lang/String;

    .line 82
    iput-object p3, p0, Lcom/miui/player/helper/AsyncMusicPlayer$MessageObj;->extra:Ljava/lang/Object;

    .line 83
    iput-object p4, p0, Lcom/miui/player/helper/AsyncMusicPlayer$MessageObj;->exception:Ljava/lang/Exception;

    .line 84
    return-void
.end method
