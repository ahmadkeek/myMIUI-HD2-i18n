.class public Lcom/miui/player/plugin/PlugInManager;
.super Ljava/lang/Object;
.source "PlugInManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/player/plugin/PlugInManager$CheckedStatus;
    }
.end annotation


# static fields
.field static final ALREADY_NEWEST:I = 0x0

.field static final FIND_NEW:I = 0x3

.field private static final KEY_LAST_BUILD:Ljava/lang/String; = "last_build"

.field public static final LYRIC_ID:I = 0x0

.field public static final ONLINE_MUSIC_ID:I = 0x1

.field static final PARSE_FAILED:I = 0x2

.field private static PLUG_INS:[Lcom/miui/player/plugin/PlugInItem; = null

.field private static final PLUG_IN_ARR:[Lcom/miui/player/plugin/PlugInManager; = null

.field private static final PLUG_IN_SIZE:I = 0x2

.field static final REQUEST_FAILED:I = 0x1

.field private static final REQUEST_TIME_MIN_INTERVAL:J = 0x36ee80L

.field private static final REQUEST_TIME_THRESHOLD:J = 0x5265c00L

.field static final TAG:Ljava/lang/String; = null

.field static final USE_DEFAULT:I = 0x4


# instance fields
.field private mNewFactoryConfig:Ljava/lang/String;

.field private mPlugInInterface:Lcom/miui/player/plugin/base/PlugInInterface;

.field private final mPlugInItem:Lcom/miui/player/plugin/PlugInItem;

.field mUpdateThreadId:J


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x2

    .line 36
    const-class v0, Lcom/miui/player/plugin/PlugInManager;

    invoke-virtual {v0}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/miui/player/plugin/PlugInManager;->TAG:Ljava/lang/String;

    .line 42
    new-array v0, v4, [Lcom/miui/player/plugin/PlugInItem;

    const/4 v1, 0x0

    new-instance v2, Lcom/miui/player/plugin/PlugInItem;

    const-class v3, Lcom/miui/player/plugin/onlinelyric/LyricPlugIn;

    invoke-virtual {v3}, Ljava/lang/Class;->getPackage()Ljava/lang/Package;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/miui/player/plugin/PlugInItem;-><init>(Ljava/lang/Package;)V

    aput-object v2, v0, v1

    const/4 v1, 0x1

    new-instance v2, Lcom/miui/player/plugin/PlugInItem;

    const-class v3, Lcom/miui/player/plugin/onlinemusic/OnlineMusicPlugIn;

    invoke-virtual {v3}, Ljava/lang/Class;->getPackage()Ljava/lang/Package;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/miui/player/plugin/PlugInItem;-><init>(Ljava/lang/Package;)V

    aput-object v2, v0, v1

    sput-object v0, Lcom/miui/player/plugin/PlugInManager;->PLUG_INS:[Lcom/miui/player/plugin/PlugInItem;

    .line 50
    new-array v0, v4, [Lcom/miui/player/plugin/PlugInManager;

    sput-object v0, Lcom/miui/player/plugin/PlugInManager;->PLUG_IN_ARR:[Lcom/miui/player/plugin/PlugInManager;

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;Lcom/miui/player/plugin/PlugInItem;)V
    .locals 3
    .parameter "context"
    .parameter "item"

    .prologue
    const/4 v2, 0x0

    .line 73
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 68
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/miui/player/plugin/PlugInManager;->mUpdateThreadId:J

    .line 70
    iput-object v2, p0, Lcom/miui/player/plugin/PlugInManager;->mPlugInInterface:Lcom/miui/player/plugin/base/PlugInInterface;

    .line 71
    iput-object v2, p0, Lcom/miui/player/plugin/PlugInManager;->mNewFactoryConfig:Ljava/lang/String;

    .line 74
    invoke-virtual {p2, p1}, Lcom/miui/player/plugin/PlugInItem;->initialize(Landroid/content/Context;)V

    .line 75
    iput-object p2, p0, Lcom/miui/player/plugin/PlugInManager;->mPlugInItem:Lcom/miui/player/plugin/PlugInItem;

    .line 76
    iget-object v0, p0, Lcom/miui/player/plugin/PlugInManager;->mPlugInItem:Lcom/miui/player/plugin/PlugInItem;

    invoke-static {p1, v0}, Lcom/miui/player/plugin/PlugInManager;->handleApkUpdate(Landroid/content/Context;Lcom/miui/player/plugin/PlugInItem;)V

    .line 77
    iget-object v0, p0, Lcom/miui/player/plugin/PlugInManager;->mPlugInItem:Lcom/miui/player/plugin/PlugInItem;

    iget-object v1, p0, Lcom/miui/player/plugin/PlugInManager;->mPlugInItem:Lcom/miui/player/plugin/PlugInItem;

    invoke-virtual {v1, p1}, Lcom/miui/player/plugin/PlugInItem;->getConfig(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, v0, v1}, Lcom/miui/player/plugin/PlugInManager;->loadFactory(Landroid/content/Context;Lcom/miui/player/plugin/PlugInItem;Ljava/lang/String;)Lcom/miui/player/plugin/base/PlugInInterface;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/player/plugin/PlugInManager;->mPlugInInterface:Lcom/miui/player/plugin/base/PlugInInterface;

    .line 78
    iget-object v0, p0, Lcom/miui/player/plugin/PlugInManager;->mPlugInInterface:Lcom/miui/player/plugin/base/PlugInInterface;

    if-nez v0, :cond_0

    .line 79
    sget-object v0, Lcom/miui/player/plugin/PlugInManager;->TAG:Ljava/lang/String;

    const-string v1, "load provider factory failed"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 81
    :cond_0
    return-void
.end method

.method static checkUpdate(Ljava/lang/String;ILjava/lang/String;)Lcom/miui/player/plugin/PlugInManager$CheckedStatus;
    .locals 5
    .parameter "localName"
    .parameter "version"
    .parameter "remoteConfig"

    .prologue
    .line 288
    if-nez p2, :cond_1

    .line 289
    new-instance p0, Lcom/miui/player/plugin/PlugInManager$CheckedStatus;

    .end local p0
    const/4 p1, 0x1

    const/4 p2, 0x0

    invoke-direct {p0, p1, p2}, Lcom/miui/player/plugin/PlugInManager$CheckedStatus;-><init>(ILjava/lang/String;)V

    .line 324
    .end local p1
    .end local p2
    :cond_0
    :goto_0
    return-object p0

    .line 292
    .restart local p0
    .restart local p1
    .restart local p2
    :cond_1
    const-string v0, "plug_in_arr"

    .line 293
    .local v0, PLUG_IN_ARRAY:Ljava/lang/String;
    const-string v0, "name"

    .line 294
    .local v0, PAIR_NAME:Ljava/lang/String;
    const-string v0, "version"

    .line 295
    .local v0, PAIR_VERSION:Ljava/lang/String;
    const-string v0, "dft_plug_in"

    .line 297
    .local v0, DEFAULT_PAIR:Ljava/lang/String;
    const/4 v2, 0x0

    .line 299
    .local v2, status:Lcom/miui/player/plugin/PlugInManager$CheckedStatus;
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, p2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 300
    .local v1, json:Lorg/json/JSONObject;
    const-string p2, "plug_in_arr"

    .end local p2
    invoke-virtual {v1, p2}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object p2

    .line 301
    .local p2, arr:Lorg/json/JSONArray;
    const/4 v0, 0x0

    .local v0, i:I
    move-object v3, v2

    .end local v2           #status:Lcom/miui/player/plugin/PlugInManager$CheckedStatus;
    .local v3, status:Lcom/miui/player/plugin/PlugInManager$CheckedStatus;
    :goto_1
    :try_start_1
    invoke-virtual {p2}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-ge v0, v2, :cond_3

    .line 302
    invoke-virtual {p2, v0}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    .line 303
    .local v2, pair:Lorg/json/JSONObject;
    const-string v4, "name"

    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_6

    .line 304
    const-string v4, "version"

    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v2

    .end local v2           #pair:Lorg/json/JSONObject;
    if-ge p1, v2, :cond_2

    .line 305
    new-instance v2, Lcom/miui/player/plugin/PlugInManager$CheckedStatus;

    const/4 v4, 0x3

    invoke-direct {v2, v4, p0}, Lcom/miui/player/plugin/PlugInManager$CheckedStatus;-><init>(ILjava/lang/String;)V

    .line 301
    .end local v3           #status:Lcom/miui/player/plugin/PlugInManager$CheckedStatus;
    .local v2, status:Lcom/miui/player/plugin/PlugInManager$CheckedStatus;
    :goto_2
    add-int/lit8 v0, v0, 0x1

    move-object v3, v2

    .end local v2           #status:Lcom/miui/player/plugin/PlugInManager$CheckedStatus;
    .restart local v3       #status:Lcom/miui/player/plugin/PlugInManager$CheckedStatus;
    goto :goto_1

    .line 307
    :cond_2
    new-instance v2, Lcom/miui/player/plugin/PlugInManager$CheckedStatus;

    const/4 v4, 0x0

    invoke-direct {v2, v4, p0}, Lcom/miui/player/plugin/PlugInManager$CheckedStatus;-><init>(ILjava/lang/String;)V

    .end local v3           #status:Lcom/miui/player/plugin/PlugInManager$CheckedStatus;
    .restart local v2       #status:Lcom/miui/player/plugin/PlugInManager$CheckedStatus;
    goto :goto_2

    .line 312
    .end local v2           #status:Lcom/miui/player/plugin/PlugInManager$CheckedStatus;
    .restart local v3       #status:Lcom/miui/player/plugin/PlugInManager$CheckedStatus;
    :cond_3
    if-nez v3, :cond_5

    .line 313
    const-string p0, "dft_plug_in"

    .end local p0
    invoke-virtual {v1, p0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p0

    .line 314
    .local p0, dft:Lorg/json/JSONObject;
    new-instance p1, Lcom/miui/player/plugin/PlugInManager$CheckedStatus;

    .end local p1
    const/4 p2, 0x4

    const-string v0, "name"

    .end local v0           #i:I
    .end local p2           #arr:Lorg/json/JSONArray;
    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .end local p0           #dft:Lorg/json/JSONObject;
    invoke-direct {p1, p2, p0}, Lcom/miui/player/plugin/PlugInManager$CheckedStatus;-><init>(ILjava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    .end local v3           #status:Lcom/miui/player/plugin/PlugInManager$CheckedStatus;
    .local p1, status:Lcom/miui/player/plugin/PlugInManager$CheckedStatus;
    move-object p0, p1

    .line 319
    .end local p1           #status:Lcom/miui/player/plugin/PlugInManager$CheckedStatus;
    .local p0, status:Lcom/miui/player/plugin/PlugInManager$CheckedStatus;
    :goto_3
    if-nez p0, :cond_0

    .line 320
    new-instance p0, Lcom/miui/player/plugin/PlugInManager$CheckedStatus;

    .end local p0           #status:Lcom/miui/player/plugin/PlugInManager$CheckedStatus;
    const/4 p1, 0x2

    const/4 p2, 0x0

    invoke-direct {p0, p1, p2}, Lcom/miui/player/plugin/PlugInManager$CheckedStatus;-><init>(ILjava/lang/String;)V

    .restart local p0       #status:Lcom/miui/player/plugin/PlugInManager$CheckedStatus;
    goto :goto_0

    .line 317
    .end local v1           #json:Lorg/json/JSONObject;
    .local v0, DEFAULT_PAIR:Ljava/lang/String;
    .restart local v2       #status:Lcom/miui/player/plugin/PlugInManager$CheckedStatus;
    .local p0, localName:Ljava/lang/String;
    .local p1, version:I
    :catch_0
    move-exception p0

    move-object p0, v2

    .line 319
    .end local v0           #DEFAULT_PAIR:Ljava/lang/String;
    .end local v2           #status:Lcom/miui/player/plugin/PlugInManager$CheckedStatus;
    .end local p1           #version:I
    .local p0, status:Lcom/miui/player/plugin/PlugInManager$CheckedStatus;
    :goto_4
    if-nez p0, :cond_0

    .line 320
    new-instance p0, Lcom/miui/player/plugin/PlugInManager$CheckedStatus;

    .end local p0           #status:Lcom/miui/player/plugin/PlugInManager$CheckedStatus;
    const/4 p1, 0x2

    const/4 p2, 0x0

    invoke-direct {p0, p1, p2}, Lcom/miui/player/plugin/PlugInManager$CheckedStatus;-><init>(ILjava/lang/String;)V

    .restart local p0       #status:Lcom/miui/player/plugin/PlugInManager$CheckedStatus;
    goto :goto_0

    .line 319
    .restart local v0       #DEFAULT_PAIR:Ljava/lang/String;
    .restart local v2       #status:Lcom/miui/player/plugin/PlugInManager$CheckedStatus;
    .local p0, localName:Ljava/lang/String;
    .restart local p1       #version:I
    :catchall_0
    move-exception p0

    move-object p1, p0

    move-object p0, v2

    .end local v0           #DEFAULT_PAIR:Ljava/lang/String;
    .end local v2           #status:Lcom/miui/player/plugin/PlugInManager$CheckedStatus;
    .end local p1           #version:I
    .local p0, status:Lcom/miui/player/plugin/PlugInManager$CheckedStatus;
    :goto_5
    if-nez p0, :cond_4

    .line 320
    new-instance p0, Lcom/miui/player/plugin/PlugInManager$CheckedStatus;

    .end local p0           #status:Lcom/miui/player/plugin/PlugInManager$CheckedStatus;
    const/4 p2, 0x2

    const/4 v0, 0x0

    invoke-direct {p0, p2, v0}, Lcom/miui/player/plugin/PlugInManager$CheckedStatus;-><init>(ILjava/lang/String;)V

    .restart local p0       #status:Lcom/miui/player/plugin/PlugInManager$CheckedStatus;
    :cond_4
    throw p1

    .line 319
    .end local p0           #status:Lcom/miui/player/plugin/PlugInManager$CheckedStatus;
    .restart local v1       #json:Lorg/json/JSONObject;
    .restart local v3       #status:Lcom/miui/player/plugin/PlugInManager$CheckedStatus;
    :catchall_1
    move-exception p0

    move-object p1, p0

    move-object p0, v3

    .end local v3           #status:Lcom/miui/player/plugin/PlugInManager$CheckedStatus;
    .restart local p0       #status:Lcom/miui/player/plugin/PlugInManager$CheckedStatus;
    goto :goto_5

    .line 317
    .end local p0           #status:Lcom/miui/player/plugin/PlugInManager$CheckedStatus;
    .restart local v3       #status:Lcom/miui/player/plugin/PlugInManager$CheckedStatus;
    :catch_1
    move-exception p0

    move-object p0, v3

    .end local v3           #status:Lcom/miui/player/plugin/PlugInManager$CheckedStatus;
    .restart local p0       #status:Lcom/miui/player/plugin/PlugInManager$CheckedStatus;
    goto :goto_4

    .local v0, i:I
    .restart local v3       #status:Lcom/miui/player/plugin/PlugInManager$CheckedStatus;
    .local p0, localName:Ljava/lang/String;
    .restart local p1       #version:I
    .restart local p2       #arr:Lorg/json/JSONArray;
    :cond_5
    move-object p0, v3

    .end local v3           #status:Lcom/miui/player/plugin/PlugInManager$CheckedStatus;
    .local p0, status:Lcom/miui/player/plugin/PlugInManager$CheckedStatus;
    goto :goto_3

    .local v2, pair:Lorg/json/JSONObject;
    .restart local v3       #status:Lcom/miui/player/plugin/PlugInManager$CheckedStatus;
    .local p0, localName:Ljava/lang/String;
    :cond_6
    move-object v2, v3

    .end local v3           #status:Lcom/miui/player/plugin/PlugInManager$CheckedStatus;
    .local v2, status:Lcom/miui/player/plugin/PlugInManager$CheckedStatus;
    goto :goto_2
.end method

.method static downloadPlugIn(Landroid/content/Context;Lcom/miui/player/plugin/PlugInItem;Ljava/lang/String;)V
    .locals 8
    .parameter "context"
    .parameter "item"
    .parameter "specific"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/client/ClientProtocolException;,
            Ljava/net/URISyntaxException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 329
    invoke-virtual {p1, p2}, Lcom/miui/player/plugin/PlugInItem;->getFileUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 330
    .local v5, url:Ljava/lang/String;
    if-nez v5, :cond_1

    .line 351
    :cond_0
    :goto_0
    return-void

    .line 334
    :cond_1
    invoke-static {v5}, Lcom/miui/player/helper/NetworkUtils;->doHttpGetSync(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v1

    .line 335
    .local v1, is:Ljava/io/InputStream;
    const/4 v2, 0x0

    .line 336
    .local v2, os:Ljava/io/FileOutputStream;
    if-eqz v1, :cond_0

    .line 338
    :try_start_0
    invoke-virtual {p1, p0}, Lcom/miui/player/plugin/PlugInItem;->getDownloadFile(Landroid/content/Context;)Ljava/io/File;

    move-result-object v0

    .line 339
    .local v0, download:Ljava/io/File;
    new-instance v4, Ljava/io/File;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ".tmp"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, v6}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 340
    .local v4, temp:Ljava/io/File;
    new-instance v3, Ljava/io/FileOutputStream;

    invoke-direct {v3, v4}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 341
    .end local v2           #os:Ljava/io/FileOutputStream;
    .local v3, os:Ljava/io/FileOutputStream;
    :try_start_1
    invoke-static {v1, v3}, Lcom/miui/player/helper/Global;->copyFile(Ljava/io/InputStream;Ljava/io/OutputStream;)V

    .line 342
    invoke-virtual {v4, v0}, Ljava/io/File;->renameTo(Ljava/io/File;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 344
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    .line 346
    if-eqz v3, :cond_3

    .line 347
    invoke-virtual {v3}, Ljava/io/FileOutputStream;->close()V

    move-object v2, v3

    .end local v3           #os:Ljava/io/FileOutputStream;
    .restart local v2       #os:Ljava/io/FileOutputStream;
    goto :goto_0

    .line 344
    .end local v0           #download:Ljava/io/File;
    .end local v4           #temp:Ljava/io/File;
    :catchall_0
    move-exception v6

    :goto_1
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    .line 346
    if-eqz v2, :cond_2

    .line 347
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V

    :cond_2
    throw v6

    .line 344
    .end local v2           #os:Ljava/io/FileOutputStream;
    .restart local v0       #download:Ljava/io/File;
    .restart local v3       #os:Ljava/io/FileOutputStream;
    .restart local v4       #temp:Ljava/io/File;
    :catchall_1
    move-exception v6

    move-object v2, v3

    .end local v3           #os:Ljava/io/FileOutputStream;
    .restart local v2       #os:Ljava/io/FileOutputStream;
    goto :goto_1

    .end local v2           #os:Ljava/io/FileOutputStream;
    .restart local v3       #os:Ljava/io/FileOutputStream;
    :cond_3
    move-object v2, v3

    .end local v3           #os:Ljava/io/FileOutputStream;
    .restart local v2       #os:Ljava/io/FileOutputStream;
    goto :goto_0
.end method

.method static generateNewFactory(Landroid/content/Context;Ljava/io/File;Lcom/miui/player/plugin/PlugInItem;)Lcom/miui/player/plugin/base/PlugInInterface;
    .locals 3
    .parameter "context"
    .parameter "newPlugIn"
    .parameter "item"

    .prologue
    .line 354
    const/4 v1, 0x0

    .line 355
    .local v1, factory:Lcom/miui/player/plugin/base/PlugInInterface;
    invoke-virtual {p2, p0}, Lcom/miui/player/plugin/PlugInItem;->clean(Landroid/content/Context;)V

    .line 356
    invoke-virtual {p2, p0}, Lcom/miui/player/plugin/PlugInItem;->getPlugInFile(Landroid/content/Context;)Ljava/io/File;

    move-result-object v0

    .line 357
    .local v0, current:Ljava/io/File;
    invoke-virtual {p1, v0}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 358
    const/4 v2, 0x0

    invoke-static {p0, p2, v2}, Lcom/miui/player/plugin/PlugInManager;->loadFactory(Landroid/content/Context;Lcom/miui/player/plugin/PlugInItem;Ljava/lang/String;)Lcom/miui/player/plugin/base/PlugInInterface;

    move-result-object v1

    .line 361
    :cond_0
    return-object v1
.end method

.method private static getApkVersion(Landroid/content/Context;)Ljava/lang/String;
    .locals 4
    .parameter "context"

    .prologue
    const-string v1, "#"

    .line 379
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x80

    invoke-virtual {v1, v2, v3}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v0

    .line 381
    .local v0, info:Landroid/content/pm/PackageInfo;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Landroid/os/Build;->FINGERPRINT:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "#"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, v0, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "#"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, v0, Landroid/content/pm/PackageInfo;->versionCode:I

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 387
    .end local v0           #info:Landroid/content/pm/PackageInfo;
    :goto_0
    return-object v1

    .line 384
    :catch_0
    move-exception v1

    .line 387
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private static handleApkUpdate(Landroid/content/Context;Lcom/miui/player/plugin/PlugInItem;)V
    .locals 6
    .parameter "context"
    .parameter "item"

    .prologue
    const-string v5, "last_build"

    .line 365
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v3

    .line 366
    .local v3, sp:Landroid/content/SharedPreferences;
    invoke-static {p0}, Lcom/miui/player/plugin/PlugInManager;->getApkVersion(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    .line 367
    .local v0, current:Ljava/lang/String;
    const-string v4, "last_build"

    const/4 v4, 0x0

    invoke-interface {v3, v5, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 368
    .local v2, last:Ljava/lang/String;
    invoke-static {v0, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 369
    invoke-virtual {p1, p0}, Lcom/miui/player/plugin/PlugInItem;->clean(Landroid/content/Context;)V

    .line 370
    invoke-virtual {p1, p0}, Lcom/miui/player/plugin/PlugInItem;->removeConfig(Landroid/content/Context;)V

    .line 371
    invoke-interface {v3}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 372
    .local v1, editor:Landroid/content/SharedPreferences$Editor;
    const-string v4, "last_build"

    invoke-interface {v1, v5, v0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 373
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 375
    .end local v1           #editor:Landroid/content/SharedPreferences$Editor;
    :cond_0
    return-void
.end method

.method public static instance(Landroid/content/Context;I)Lcom/miui/player/plugin/PlugInManager;
    .locals 4
    .parameter "context"
    .parameter "id"

    .prologue
    .line 53
    sget-object v2, Lcom/miui/player/plugin/PlugInManager;->PLUG_IN_ARR:[Lcom/miui/player/plugin/PlugInManager;

    aget-object v0, v2, p1

    .line 54
    .local v0, mgr:Lcom/miui/player/plugin/PlugInManager;
    if-nez v0, :cond_0

    .line 55
    sget-object v2, Lcom/miui/player/plugin/PlugInManager;->PLUG_IN_ARR:[Lcom/miui/player/plugin/PlugInManager;

    monitor-enter v2

    .line 56
    :try_start_0
    new-instance v1, Lcom/miui/player/plugin/PlugInManager;

    sget-object v3, Lcom/miui/player/plugin/PlugInManager;->PLUG_INS:[Lcom/miui/player/plugin/PlugInItem;

    aget-object v3, v3, p1

    invoke-direct {v1, p0, v3}, Lcom/miui/player/plugin/PlugInManager;-><init>(Landroid/content/Context;Lcom/miui/player/plugin/PlugInItem;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 57
    .end local v0           #mgr:Lcom/miui/player/plugin/PlugInManager;
    .local v1, mgr:Lcom/miui/player/plugin/PlugInManager;
    :try_start_1
    sget-object v3, Lcom/miui/player/plugin/PlugInManager;->PLUG_IN_ARR:[Lcom/miui/player/plugin/PlugInManager;

    aput-object v1, v3, p1

    .line 58
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    move-object v0, v1

    .line 61
    .end local v1           #mgr:Lcom/miui/player/plugin/PlugInManager;
    .restart local v0       #mgr:Lcom/miui/player/plugin/PlugInManager;
    :cond_0
    return-object v0

    .line 58
    :catchall_0
    move-exception v3

    :goto_0
    :try_start_2
    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v3

    .end local v0           #mgr:Lcom/miui/player/plugin/PlugInManager;
    .restart local v1       #mgr:Lcom/miui/player/plugin/PlugInManager;
    :catchall_1
    move-exception v3

    move-object v0, v1

    .end local v1           #mgr:Lcom/miui/player/plugin/PlugInManager;
    .restart local v0       #mgr:Lcom/miui/player/plugin/PlugInManager;
    goto :goto_0
.end method

.method private static isPlugInEquals(Lcom/miui/player/plugin/base/PlugInInterface;Lcom/miui/player/plugin/base/PlugInInterface;)Z
    .locals 4
    .parameter "first"
    .parameter "second"

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 391
    if-nez p0, :cond_0

    if-nez p1, :cond_0

    move v0, v3

    .line 399
    :goto_0
    return v0

    .line 395
    :cond_0
    if-eqz p0, :cond_1

    if-nez p1, :cond_2

    :cond_1
    move v0, v2

    .line 396
    goto :goto_0

    .line 399
    :cond_2
    invoke-interface {p0}, Lcom/miui/player/plugin/base/PlugInInterface;->getVersion()I

    move-result v0

    invoke-interface {p1}, Lcom/miui/player/plugin/base/PlugInInterface;->getVersion()I

    move-result v1

    if-ne v0, v1, :cond_3

    invoke-interface {p0}, Lcom/miui/player/plugin/base/PlugInInterface;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1}, Lcom/miui/player/plugin/base/PlugInInterface;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_3

    move v0, v3

    goto :goto_0

    :cond_3
    move v0, v2

    goto :goto_0
.end method

.method private static loadFactory(Landroid/content/Context;Lcom/miui/player/plugin/PlugInItem;Ljava/lang/String;)Lcom/miui/player/plugin/base/PlugInInterface;
    .locals 5
    .parameter "context"
    .parameter "item"
    .parameter "config"

    .prologue
    .line 84
    invoke-virtual {p1, p0}, Lcom/miui/player/plugin/PlugInItem;->getPlugInFile(Landroid/content/Context;)Ljava/io/File;

    move-result-object v0

    .line 85
    .local v0, plugIn:Ljava/io/File;
    invoke-static {p0, v0, p1}, Lcom/miui/player/plugin/PlugInManager;->trytoCreateProvider(Landroid/content/Context;Ljava/io/File;Lcom/miui/player/plugin/PlugInItem;)Lcom/miui/player/plugin/base/PlugInInterface;

    move-result-object v1

    .line 86
    .local v1, providerFactory:Lcom/miui/player/plugin/base/PlugInInterface;
    if-nez v1, :cond_0

    .line 87
    sget-object v2, Lcom/miui/player/plugin/PlugInManager;->TAG:Ljava/lang/String;

    const-string v3, "try to create provider factory failed, delete it and try again!"

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 88
    invoke-virtual {p1, p0}, Lcom/miui/player/plugin/PlugInItem;->clean(Landroid/content/Context;)V

    .line 89
    invoke-static {p0, v0, p1}, Lcom/miui/player/plugin/PlugInManager;->trytoCreateProvider(Landroid/content/Context;Ljava/io/File;Lcom/miui/player/plugin/PlugInItem;)Lcom/miui/player/plugin/base/PlugInInterface;

    move-result-object v1

    .line 92
    :cond_0
    if-eqz v1, :cond_1

    .line 93
    invoke-interface {v1, p2}, Lcom/miui/player/plugin/base/PlugInInterface;->initialize(Ljava/lang/String;)V

    .line 94
    sget-object v2, Lcom/miui/player/plugin/PlugInManager;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Lcom/miui/player/plugin/PlugInItem;->getFileName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " load success:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " version="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-interface {v1}, Lcom/miui/player/plugin/base/PlugInInterface;->getVersion()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " name="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-interface {v1}, Lcom/miui/player/plugin/base/PlugInInterface;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 99
    :cond_1
    return-object v1
.end method

.method static requestConfig(Lcom/miui/player/plugin/PlugInItem;)Ljava/lang/String;
    .locals 6
    .parameter "item"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/client/ClientProtocolException;,
            Ljava/net/URISyntaxException;,
            Ljava/io/IOException;,
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 251
    invoke-virtual {p0}, Lcom/miui/player/plugin/PlugInItem;->getVersionUrl()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/miui/player/helper/NetworkUtils;->doHttpGetSync(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v2

    .line 252
    .local v2, is:Ljava/io/InputStream;
    if-eqz v2, :cond_1

    .line 254
    const/16 v5, 0x80

    :try_start_0
    new-array v0, v5, [C

    .line 255
    .local v0, buf:[C
    new-instance v3, Ljava/io/InputStreamReader;

    invoke-direct {v3, v2}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    .line 256
    .local v3, isr:Ljava/io/InputStreamReader;
    new-instance v4, Ljava/lang/StringBuilder;

    array-length v5, v0

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 257
    .local v4, sb:Ljava/lang/StringBuilder;
    const/4 v1, -0x1

    .line 258
    .local v1, i:I
    :goto_0
    invoke-virtual {v3, v0}, Ljava/io/InputStreamReader;->read([C)I

    move-result v1

    const/4 v5, -0x1

    if-eq v1, v5, :cond_0

    .line 259
    const/4 v5, 0x0

    invoke-virtual {v4, v0, v5, v1}, Ljava/lang/StringBuilder;->append([CII)Ljava/lang/StringBuilder;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 264
    .end local v0           #buf:[C
    .end local v1           #i:I
    .end local v3           #isr:Ljava/io/InputStreamReader;
    .end local v4           #sb:Ljava/lang/StringBuilder;
    :catchall_0
    move-exception v5

    invoke-virtual {v2}, Ljava/io/InputStream;->close()V

    throw v5

    .line 262
    .restart local v0       #buf:[C
    .restart local v1       #i:I
    .restart local v3       #isr:Ljava/io/InputStreamReader;
    .restart local v4       #sb:Ljava/lang/StringBuilder;
    :cond_0
    :try_start_1
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v5

    .line 264
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V

    .line 268
    .end local v0           #buf:[C
    .end local v1           #i:I
    .end local v3           #isr:Ljava/io/InputStreamReader;
    .end local v4           #sb:Ljava/lang/StringBuilder;
    :goto_1
    return-object v5

    :cond_1
    const/4 v5, 0x0

    goto :goto_1
.end method

.method private static setupPlugIn(Landroid/content/Context;Ljava/io/File;)V
    .locals 6
    .parameter "context"
    .parameter "plugIn"

    .prologue
    .line 136
    const/4 v1, 0x0

    .line 137
    .local v1, is:Ljava/io/InputStream;
    const/4 v2, 0x0

    .line 139
    .local v2, os:Ljava/io/OutputStream;
    :try_start_0
    invoke-virtual {p1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v0

    .line 140
    .local v0, asset:Ljava/lang/String;
    invoke-virtual {p0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v4

    invoke-virtual {v4, v0}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v1

    .line 141
    new-instance v3, Ljava/io/FileOutputStream;

    invoke-direct {v3, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 142
    .end local v2           #os:Ljava/io/OutputStream;
    .local v3, os:Ljava/io/OutputStream;
    :try_start_1
    invoke-static {v1, v3}, Lcom/miui/player/helper/Global;->copyFile(Ljava/io/InputStream;Ljava/io/OutputStream;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_7

    .line 145
    if-eqz v1, :cond_0

    .line 147
    :try_start_2
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_3

    .line 152
    :cond_0
    :goto_0
    if-eqz v3, :cond_5

    .line 154
    :try_start_3
    invoke-virtual {v3}, Ljava/io/FileOutputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0

    move-object v2, v3

    .line 159
    .end local v0           #asset:Ljava/lang/String;
    .end local v3           #os:Ljava/io/OutputStream;
    .restart local v2       #os:Ljava/io/OutputStream;
    :cond_1
    :goto_1
    return-void

    .line 155
    .end local v2           #os:Ljava/io/OutputStream;
    .restart local v0       #asset:Ljava/lang/String;
    .restart local v3       #os:Ljava/io/OutputStream;
    :catch_0
    move-exception v4

    move-object v2, v3

    .line 156
    .end local v3           #os:Ljava/io/OutputStream;
    .restart local v2       #os:Ljava/io/OutputStream;
    goto :goto_1

    .line 143
    .end local v0           #asset:Ljava/lang/String;
    :catch_1
    move-exception v4

    .line 145
    :goto_2
    if-eqz v1, :cond_2

    .line 147
    :try_start_4
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_4

    .line 152
    :cond_2
    :goto_3
    if-eqz v2, :cond_1

    .line 154
    :try_start_5
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_2

    goto :goto_1

    .line 155
    :catch_2
    move-exception v4

    goto :goto_1

    .line 145
    :catchall_0
    move-exception v4

    :goto_4
    if-eqz v1, :cond_3

    .line 147
    :try_start_6
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_5

    .line 152
    :cond_3
    :goto_5
    if-eqz v2, :cond_4

    .line 154
    :try_start_7
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_6

    .line 156
    :cond_4
    :goto_6
    throw v4

    .line 148
    .end local v2           #os:Ljava/io/OutputStream;
    .restart local v0       #asset:Ljava/lang/String;
    .restart local v3       #os:Ljava/io/OutputStream;
    :catch_3
    move-exception v4

    goto :goto_0

    .end local v0           #asset:Ljava/lang/String;
    .end local v3           #os:Ljava/io/OutputStream;
    .restart local v2       #os:Ljava/io/OutputStream;
    :catch_4
    move-exception v4

    goto :goto_3

    :catch_5
    move-exception v5

    goto :goto_5

    .line 155
    :catch_6
    move-exception v5

    goto :goto_6

    .line 145
    .end local v2           #os:Ljava/io/OutputStream;
    .restart local v0       #asset:Ljava/lang/String;
    .restart local v3       #os:Ljava/io/OutputStream;
    :catchall_1
    move-exception v4

    move-object v2, v3

    .end local v3           #os:Ljava/io/OutputStream;
    .restart local v2       #os:Ljava/io/OutputStream;
    goto :goto_4

    .line 143
    .end local v2           #os:Ljava/io/OutputStream;
    .restart local v3       #os:Ljava/io/OutputStream;
    :catch_7
    move-exception v4

    move-object v2, v3

    .end local v3           #os:Ljava/io/OutputStream;
    .restart local v2       #os:Ljava/io/OutputStream;
    goto :goto_2

    .end local v2           #os:Ljava/io/OutputStream;
    .restart local v3       #os:Ljava/io/OutputStream;
    :cond_5
    move-object v2, v3

    .end local v3           #os:Ljava/io/OutputStream;
    .restart local v2       #os:Ljava/io/OutputStream;
    goto :goto_1
.end method

.method public static tryToGetInstance(I)Lcom/miui/player/plugin/PlugInManager;
    .locals 1
    .parameter "id"

    .prologue
    .line 65
    sget-object v0, Lcom/miui/player/plugin/PlugInManager;->PLUG_IN_ARR:[Lcom/miui/player/plugin/PlugInManager;

    aget-object v0, v0, p0

    return-object v0
.end method

.method private tryToUpdatePlugIn(Landroid/content/Context;Lcom/miui/player/plugin/PlugInItem;Ljava/lang/String;I)Ljava/lang/Thread;
    .locals 6
    .parameter "context"
    .parameter "item"
    .parameter "localName"
    .parameter "localVersion"

    .prologue
    .line 201
    sget-object v1, Lcom/miui/player/plugin/PlugInManager;->TAG:Ljava/lang/String;

    const-string v2, "try to download remote plug-in"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 202
    if-eqz p1, :cond_0

    if-nez p3, :cond_1

    .line 203
    :cond_0
    const/4 v1, 0x0

    .line 245
    :goto_0
    return-object v1

    .line 206
    :cond_1
    new-instance v0, Lcom/miui/player/plugin/PlugInManager$1;

    move-object v1, p0

    move-object v2, p2

    move-object v3, p3

    move v4, p4

    move-object v5, p1

    invoke-direct/range {v0 .. v5}, Lcom/miui/player/plugin/PlugInManager$1;-><init>(Lcom/miui/player/plugin/PlugInManager;Lcom/miui/player/plugin/PlugInItem;Ljava/lang/String;ILandroid/content/Context;)V

    .local v0, thread:Ljava/lang/Thread;
    move-object v1, v0

    .line 245
    goto :goto_0
.end method

.method private static trytoCreateProvider(Landroid/content/Context;Ljava/io/File;Lcom/miui/player/plugin/PlugInItem;)Lcom/miui/player/plugin/base/PlugInInterface;
    .locals 15
    .parameter "context"
    .parameter "plugIn"
    .parameter "item"

    .prologue
    const-string v14, " load end by times="

    .line 103
    const/4 v9, 0x0

    .line 104
    .local v9, pii:Lcom/miui/player/plugin/base/PlugInInterface;
    invoke-virtual/range {p1 .. p1}, Ljava/io/File;->exists()Z

    move-result v10

    if-nez v10, :cond_0

    .line 105
    invoke-static/range {p0 .. p1}, Lcom/miui/player/plugin/PlugInManager;->setupPlugIn(Landroid/content/Context;Ljava/io/File;)V

    .line 108
    :cond_0
    invoke-virtual/range {p1 .. p1}, Ljava/io/File;->exists()Z

    move-result v10

    if-eqz v10, :cond_1

    .line 109
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    .line 110
    .local v2, c:J
    invoke-virtual/range {p1 .. p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    .line 111
    .local v5, dexPath:Ljava/lang/String;
    move-object/from16 v0, p2

    move-object v1, p0

    invoke-virtual {v0, v1}, Lcom/miui/player/plugin/PlugInItem;->getDexTempDir(Landroid/content/Context;)Ljava/io/File;

    move-result-object v10

    invoke-virtual {v10}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    .line 112
    .local v4, dexOutput:Ljava/lang/String;
    sget-object v10, Lcom/miui/player/plugin/PlugInManager;->TAG:Ljava/lang/String;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v11, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, " load start"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 113
    new-instance v8, Ldalvik/system/DexClassLoader;

    const/4 v10, 0x0

    invoke-virtual {p0}, Landroid/content/Context;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v11

    invoke-direct {v8, v5, v4, v10, v11}, Ldalvik/system/DexClassLoader;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/ClassLoader;)V

    .line 115
    .local v8, loader:Ldalvik/system/DexClassLoader;
    :try_start_0
    move-object/from16 v0, p2

    move-object v1, v8

    invoke-virtual {v0, v1}, Lcom/miui/player/plugin/PlugInItem;->getFactoryPath(Ldalvik/system/DexClassLoader;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v8, v10}, Ldalvik/system/DexClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v7

    .line 116
    .local v7, factory:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    invoke-virtual {v7}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v10

    move-object v0, v10

    check-cast v0, Lcom/miui/player/plugin/base/PlugInInterface;

    move-object v9, v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/InstantiationException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_2

    .line 124
    sget-object v10, Lcom/miui/player/plugin/PlugInManager;->TAG:Ljava/lang/String;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v11, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, " load end by times="

    invoke-virtual {v11, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v12

    sub-long/2addr v12, v2

    invoke-virtual {v11, v12, v13}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 128
    .end local v2           #c:J
    .end local v4           #dexOutput:Ljava/lang/String;
    .end local v5           #dexPath:Ljava/lang/String;
    .end local v7           #factory:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    .end local v8           #loader:Ldalvik/system/DexClassLoader;
    :cond_1
    :goto_0
    return-object v9

    .line 117
    .restart local v2       #c:J
    .restart local v4       #dexOutput:Ljava/lang/String;
    .restart local v5       #dexPath:Ljava/lang/String;
    .restart local v8       #loader:Ldalvik/system/DexClassLoader;
    :catch_0
    move-exception v10

    move-object v6, v10

    .line 118
    .local v6, e:Ljava/lang/ClassNotFoundException;
    :try_start_1
    sget-object v10, Lcom/miui/player/plugin/PlugInManager;->TAG:Ljava/lang/String;

    invoke-virtual {v6}, Ljava/lang/ClassNotFoundException;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 124
    sget-object v10, Lcom/miui/player/plugin/PlugInManager;->TAG:Ljava/lang/String;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v11, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, " load end by times="

    invoke-virtual {v11, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v12

    sub-long/2addr v12, v2

    invoke-virtual {v11, v12, v13}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 119
    .end local v6           #e:Ljava/lang/ClassNotFoundException;
    :catch_1
    move-exception v10

    move-object v6, v10

    .line 120
    .local v6, e:Ljava/lang/InstantiationException;
    :try_start_2
    sget-object v10, Lcom/miui/player/plugin/PlugInManager;->TAG:Ljava/lang/String;

    invoke-virtual {v6}, Ljava/lang/InstantiationException;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 124
    sget-object v10, Lcom/miui/player/plugin/PlugInManager;->TAG:Ljava/lang/String;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v11, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, " load end by times="

    invoke-virtual {v11, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v12

    sub-long/2addr v12, v2

    invoke-virtual {v11, v12, v13}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 121
    .end local v6           #e:Ljava/lang/InstantiationException;
    :catch_2
    move-exception v10

    move-object v6, v10

    .line 122
    .local v6, e:Ljava/lang/IllegalAccessException;
    :try_start_3
    sget-object v10, Lcom/miui/player/plugin/PlugInManager;->TAG:Ljava/lang/String;

    invoke-virtual {v6}, Ljava/lang/IllegalAccessException;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 124
    sget-object v10, Lcom/miui/player/plugin/PlugInManager;->TAG:Ljava/lang/String;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v11, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, " load end by times="

    invoke-virtual {v11, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v12

    sub-long/2addr v12, v2

    invoke-virtual {v11, v12, v13}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .end local v6           #e:Ljava/lang/IllegalAccessException;
    :catchall_0
    move-exception v10

    sget-object v11, Lcom/miui/player/plugin/PlugInManager;->TAG:Ljava/lang/String;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v12, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, " load end by times="

    invoke-virtual {v12, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v13

    sub-long/2addr v13, v2

    invoke-virtual {v12, v13, v14}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    throw v10
.end method


# virtual methods
.method public declared-synchronized getPlugInInterface(Landroid/content/Context;)Lcom/miui/player/plugin/base/PlugInInterface;
    .locals 7
    .parameter "context"

    .prologue
    .line 162
    monitor-enter p0

    :try_start_0
    iget-object v3, p0, Lcom/miui/player/plugin/PlugInManager;->mPlugInItem:Lcom/miui/player/plugin/PlugInItem;

    invoke-virtual {v3, p1}, Lcom/miui/player/plugin/PlugInItem;->getDownloadFile(Landroid/content/Context;)Ljava/io/File;

    move-result-object v2

    .line 163
    .local v2, tmp:Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 164
    iget-object v3, p0, Lcom/miui/player/plugin/PlugInManager;->mPlugInItem:Lcom/miui/player/plugin/PlugInItem;

    invoke-static {p1, v2, v3}, Lcom/miui/player/plugin/PlugInManager;->generateNewFactory(Landroid/content/Context;Ljava/io/File;Lcom/miui/player/plugin/PlugInItem;)Lcom/miui/player/plugin/base/PlugInInterface;

    move-result-object v0

    .line 165
    .local v0, pii:Lcom/miui/player/plugin/base/PlugInInterface;
    if-eqz v0, :cond_0

    .line 166
    iget-object v3, p0, Lcom/miui/player/plugin/PlugInManager;->mPlugInItem:Lcom/miui/player/plugin/PlugInItem;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-virtual {v3, p1, v4, v5}, Lcom/miui/player/plugin/PlugInItem;->updateRequestTimePref(Landroid/content/Context;J)V

    .line 167
    iget-object v3, p0, Lcom/miui/player/plugin/PlugInManager;->mPlugInInterface:Lcom/miui/player/plugin/base/PlugInInterface;

    invoke-static {v0, v3}, Lcom/miui/player/plugin/PlugInManager;->isPlugInEquals(Lcom/miui/player/plugin/base/PlugInInterface;Lcom/miui/player/plugin/base/PlugInInterface;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 168
    iput-object v0, p0, Lcom/miui/player/plugin/PlugInManager;->mPlugInInterface:Lcom/miui/player/plugin/base/PlugInInterface;

    .line 169
    iget-object v3, p0, Lcom/miui/player/plugin/PlugInManager;->mPlugInItem:Lcom/miui/player/plugin/PlugInItem;

    invoke-virtual {v3, p1}, Lcom/miui/player/plugin/PlugInItem;->removeConfig(Landroid/content/Context;)V

    .line 170
    const/4 v3, 0x0

    iput-object v3, p0, Lcom/miui/player/plugin/PlugInManager;->mNewFactoryConfig:Ljava/lang/String;

    .line 175
    .end local v0           #pii:Lcom/miui/player/plugin/base/PlugInInterface;
    :cond_0
    iget-object v3, p0, Lcom/miui/player/plugin/PlugInManager;->mNewFactoryConfig:Ljava/lang/String;

    if-eqz v3, :cond_1

    .line 176
    iget-object v3, p0, Lcom/miui/player/plugin/PlugInManager;->mPlugInItem:Lcom/miui/player/plugin/PlugInItem;

    iget-object v4, p0, Lcom/miui/player/plugin/PlugInManager;->mNewFactoryConfig:Ljava/lang/String;

    invoke-virtual {v3, p1, v4}, Lcom/miui/player/plugin/PlugInItem;->updateConfigPref(Landroid/content/Context;Ljava/lang/String;)V

    .line 177
    const/4 v3, 0x0

    iput-object v3, p0, Lcom/miui/player/plugin/PlugInManager;->mNewFactoryConfig:Ljava/lang/String;

    .line 180
    :cond_1
    iget-object v3, p0, Lcom/miui/player/plugin/PlugInManager;->mPlugInInterface:Lcom/miui/player/plugin/base/PlugInInterface;

    if-eqz v3, :cond_2

    iget-wide v3, p0, Lcom/miui/player/plugin/PlugInManager;->mUpdateThreadId:J

    const-wide/16 v5, 0x0

    cmp-long v3, v3, v5

    if-nez v3, :cond_2

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    iget-object v5, p0, Lcom/miui/player/plugin/PlugInManager;->mPlugInItem:Lcom/miui/player/plugin/PlugInItem;

    invoke-virtual {v5, p1}, Lcom/miui/player/plugin/PlugInItem;->getRequestTime(Landroid/content/Context;)J

    move-result-wide v5

    sub-long/2addr v3, v5

    const-wide/32 v5, 0x5265c00

    cmp-long v3, v3, v5

    if-lez v3, :cond_2

    .line 182
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    iget-object v4, p0, Lcom/miui/player/plugin/PlugInManager;->mPlugInItem:Lcom/miui/player/plugin/PlugInItem;

    iget-object v5, p0, Lcom/miui/player/plugin/PlugInManager;->mPlugInInterface:Lcom/miui/player/plugin/base/PlugInInterface;

    invoke-interface {v5}, Lcom/miui/player/plugin/base/PlugInInterface;->getName()Ljava/lang/String;

    move-result-object v5

    iget-object v6, p0, Lcom/miui/player/plugin/PlugInManager;->mPlugInInterface:Lcom/miui/player/plugin/base/PlugInInterface;

    invoke-interface {v6}, Lcom/miui/player/plugin/base/PlugInInterface;->getVersion()I

    move-result v6

    invoke-direct {p0, v3, v4, v5, v6}, Lcom/miui/player/plugin/PlugInManager;->tryToUpdatePlugIn(Landroid/content/Context;Lcom/miui/player/plugin/PlugInItem;Ljava/lang/String;I)Ljava/lang/Thread;

    move-result-object v1

    .line 184
    .local v1, thread:Ljava/lang/Thread;
    if-eqz v1, :cond_2

    .line 185
    invoke-virtual {v1}, Ljava/lang/Thread;->getId()J

    move-result-wide v3

    iput-wide v3, p0, Lcom/miui/player/plugin/PlugInManager;->mUpdateThreadId:J

    .line 186
    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    .line 190
    .end local v1           #thread:Ljava/lang/Thread;
    :cond_2
    iget-object v3, p0, Lcom/miui/player/plugin/PlugInManager;->mPlugInInterface:Lcom/miui/player/plugin/base/PlugInInterface;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v3

    .line 162
    .end local v2           #tmp:Ljava/io/File;
    :catchall_0
    move-exception v3

    monitor-exit p0

    throw v3
.end method

.method public declared-synchronized statistics(Z)V
    .locals 1
    .parameter "success"

    .prologue
    .line 194
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/miui/player/plugin/PlugInManager;->mPlugInInterface:Lcom/miui/player/plugin/base/PlugInInterface;

    if-eqz v0, :cond_0

    .line 195
    iget-object v0, p0, Lcom/miui/player/plugin/PlugInManager;->mPlugInInterface:Lcom/miui/player/plugin/base/PlugInInterface;

    invoke-interface {v0, p1}, Lcom/miui/player/plugin/base/PlugInInterface;->statistics(Z)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/player/plugin/PlugInManager;->mNewFactoryConfig:Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 197
    :cond_0
    monitor-exit p0

    return-void

    .line 194
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
